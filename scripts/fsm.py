import math
import os
import re
from pathlib import Path
from typing import TextIO, Union

import numpy as np
import pandas as pd


def append_others_row(
    fsm: pd.DataFrame,
    current_state: str,
) -> pd.DataFrame:
    """Appends a new row in the end representing the other states. This is
    done so as to have safe behavior when others input are generated. The
    new row is appended to the end of the dataframe.

    Args:
        fsm (pd.DataFrame): The truth table from the excel file.
        current_state (str): The current state to be appended.

    Returns:
        pd.DataFrame: The truth table with the new row appended.
    """
    others_row = pd.DataFrame(
        [{
            "Current State": f"{current_state}",
            "Next State": "S0",
            "Inputs Aggregated": "others",
            "IRWrite": "0",
            "RegWrite": "0",
            "MAWrite": "0",
            "MemWrite": "0",
            "FlagsWrite": "0",
            "PCSrc[1:0]": "00",
            "PCWrite": "1"
        }],
        index=pd.MultiIndex.from_tuples([("OTH", len(fsm))])
    )

    return pd.concat([fsm, others_row], axis=0)


def format_case_table(fsm: pd.DataFrame) -> pd.DataFrame:
    """Formats the truth table to be used in the vhdl cases. It executes
    the data manipulation:  

    1. Joins all the sheets together, 
    2. Sorts them by the current state, 
    3. Removes duplicates and 
    4. Resets the indices. 
    5. Appends a new row for every state than has more than one transition.
    6. Appends a new row in the end representing the others.

    Afterwards, the string manipulation is executed:

    1. Joins all the inputs together
    2. Removes spaces and replaces X's with dashes/don't cares. Except 0s and 1s, the 
       characters might be "-" or "Not15".

    Args:
        fsm (pd.DataFrame): The truth table from the excel file.

    Returns:
        pd.DataFrame: The truth table formatted.
    """
    ### Data manipulation ###

    # Concatenate all the sheets into one dataframe
    fsm = pd.concat(fsm)
    # Romve duplicate instructions
    fsm = fsm.drop_duplicates()

    ### String manipulation ###
    states_range = range(0, 2)
    inputs_range = range(2, 8)
    outputs_range = range(8, 15)

    columns = fsm.columns

    # States of the fsm
    states = fsm[columns[states_range]]
    # Aggregate all inputs together
    inputs = pd.DataFrame(
        fsm[columns[inputs_range]].apply(lambda x: "".join(x), axis=1),
        columns=["Inputs Aggregated"]
    )
    # Outputs of the fsm
    outputs = fsm[columns[outputs_range]]

    # New fsm truth table with inputs aggregated
    fsm_table = pd.concat([states, inputs, outputs], axis=1)

    # Remove spaces and X's with dashes/don't cares ("-")
    fsm_formated = pd.DataFrame(
        fsm_table.map(
            lambda x: x.replace(" ", "").replace("X", "-")
        )
    )

    ### Data manipulation ###

    # # Append new row for every state than has more than one transition
    # so as to have safe behavior when others input are generated
    fsm_formated = append_others_row(fsm_formated, "S1")
    fsm_formated = append_others_row(fsm_formated, "S2a")
    fsm_formated = append_others_row(fsm_formated, "S2b")
    fsm_formated = append_others_row(fsm_formated, "S3")

    # # Append a new row in the end representing the other states
    fsm_formated = append_others_row(fsm_formated, "others")

    # Sort rows them by the current state
    fsm_formated = fsm_formated.sort_values(by=["Current State", "Next State"], ascending=[True, False])

    # Make sure indices are correct
    fsm_formated = fsm_formated.set_index(
        [
            fsm_formated.index.get_level_values(0),
            pd.RangeIndex(len(fsm_formated))
        ]
    )

    return fsm_formated


def replace_with_binary_numbers(
        strings_array: Union[str, list[str]],
        bin_start: int,
        bin_stop: int,
        reg_exp: str
) -> list[str]:
    """Replaces the charecters outlined by the regular expression with the
    binary numbers from bin_start to bin_stop. It returns a list with all
    the strings with the replaced characters.

    Args:
        strings_array (list[str] | str): List of strings to be replaced.
        bin_start (int): Where to start the binary numbers.
        bin_stop (int): Where to stop the binary numbers.
        reg_exp (str): Regular expression to find the characters to be replaced.

    Raises:
        TypeError: When strings_array is not a list or a string.

    Returns:
        list[str]: A list with all the strings with the replaced characters.
    """
    # Check fo the type of the input
    if type(strings_array) == str:
        strings_array = [strings_array]
    elif type(strings_array) != list:
        raise TypeError("strings_array must be a list or a string")

    # Loop through the strings and replace the characters
    for index, string in enumerate(strings_array):
        # Create the binary numbers
        bin_len = math.ceil(math.log2(bin_stop - bin_start))
        bin_numbers = [format(num, f"0{bin_len}b") for num in range(bin_start, bin_stop + 1)]

        # Create a list of the same string to be replaced
        string_replaced = [string for _ in range(len(bin_numbers))]

        # For each string, replace the characters with the binary numbers
        for i, bin_number in enumerate(bin_numbers):
            tmp_string = string_replaced[i]
            regex_iter = re.finditer(reg_exp, tmp_string)

            # Hold the letters used from the binary number
            bin_letter_pointer = 0

            # Iterate over found groups of characters to be replaced
            for regex_group in regex_iter:
                (start_pos, stop_pos) = regex_group.span()
                regex_group_len = stop_pos - start_pos

                tmp_string = tmp_string[0:start_pos] + bin_number[bin_letter_pointer:bin_letter_pointer + regex_group_len] + tmp_string[stop_pos:]

                bin_letter_pointer += regex_group_len

            string_replaced[i] = tmp_string

        strings_array[index] = string_replaced

    # Flatten the list
    strings_array = [item for sublist in strings_array for item in sublist]

    return strings_array


def generate_variables(
    inputs: str,
) -> list[str]:
    """Generates the binary numbers for the function code. It replaces
    the "-" in the function code with all the binary numbers of the same
    length. Also, it replaces Not15 with all the binary numbers of length 
    4, except 15.

    Args:
        inputs (str): Function code with don't cares ("-") and maybe Not15.

    Returns:
        list[str]: List of all the function codes with the "-" replaced with
        the binary numbers and Not15 replaced with all the binary numbers of
        length 4, except 15.
    """
    inputs_array = [inputs]

    if re.search(r'Not15', inputs):
        inputs_array = replace_with_binary_numbers(inputs_array, 0, 14, r'Not15')

    if re.search(r'-', inputs):
        dash_num = len(re.findall(r'-', inputs))
        inputs_array = replace_with_binary_numbers(inputs_array, 0, 2**dash_num - 1, r'[-]+')

    return inputs_array


def assign_variables(
    f: TextIO,
    vhdl_vars_dict: dict[str, str],
    row: pd.Series,
    spaces: str,
) -> None:
    """Assigns the vhdl variables to the corresponding values in the
    truth table. It uses the vhdl_vars_dict to name the corresponding output
    variables.

    Args:
        f (TextIO): File to write the vhdl cases (prefered .txt).
        vhd_vars_dict (dict[str, str]): VHDL variables to be used in the cases.
        row (pd.Series): Row of the truth table.
        spaces (str): Spaces to be used in the file as indentation.
    """
    # Next State
    f.write(f"{spaces}-- Next State\n")
    f.write(f"{spaces}{vhdl_vars_dict['Next State']} <= {row['Next State']};\n")

    # Outputs
    f.write(f"{spaces}-- Outputs\n")

    for index in row.index[3:]:
        # Not all zero (initial case)
        if (len(re.findall(r'0', row[index])) < len(row[index])):
            if (index != "PCSrc[1:0]"):
                f.write(f"{spaces}{vhdl_vars_dict[index]} <= \'{row[index]}\';\n")
            else:
                f.write(f"{spaces}{vhdl_vars_dict[index]} <= \"{row[index]}\";\n")


def print_case(f: TextIO,
               fsm_table: np.ndarray,
               vhdl_vars_dict: dict) -> None:
    # print(f"{114*'~'}")
    # print(fsm_table)
    # print(f"{114*'~'}")

    for index in fsm_table.columns[3:]:
        if (index != "PCSrc[1:0]"):
            f.write(f"{vhdl_vars_dict[index]} <= \'0\';\n")
        else:
            f.write(f"{vhdl_vars_dict[index]} <= \"00\";\n")

    f.write(f"\ncase {vhdl_vars_dict['Current State']} is \n")

    for index, row in fsm_table.iterrows():
        # ~~~~~~~~~~~~~~~~~~~~~~~~ State changes ~~~~~~~~~~~~~~~~~~~~~~~~ #
        prev_state_change = (
            (index[1] > 0) and
            (row['Current State'] != fsm_table.iloc[index[1] - 1]['Current State']) and
            (row['Inputs Aggregated'] != "others")
        )
        initial_state = (index[1] == 0)
        end_state = (index[1] == len(fsm_table) - 1)

        # Print only when the state changes
        if (prev_state_change or initial_state or end_state):
            f.write(f"\n{2*' '}when {row['Current State']} =>\n")

        # ~~~~~~~~~~~~~~~~~~~~~~~~ Outputs and next state ~~~~~~~~~~~~~~~~~~~~~~~~ #
        dont_care_inputs = (
            row['Inputs Aggregated'] == "----------"
        )
        next_state_change = (
            index[1] < len(fsm_table) - 1 and
            (row['Current State'] != fsm_table.iloc[index[1] + 1]['Current State'])
        )

        # Only assign variables, since there is only one transition from this state
        if (dont_care_inputs or (index[1] == len(fsm_table) - 1)):
            # The flowing correspond to this instruction
            f.write(f"{4*' '}{12*'-'} {index[0]} {12*'-'}\n")
            assign_variables(f, vhdl_vars_dict, row, f"{4*' '}")
        else:
            # Print case statement, since there is more than one transitions from this state
            if ((not next_state_change) and (prev_state_change) or (index[1] == 0)):
                f.write(f"{4*' '}case {vhdl_vars_dict['Inputs Aggregated']} is\n")

            # Print when "..." => (case is already open)
            inputs_array = generate_variables(row['Inputs Aggregated'])

            for inputs in inputs_array:
                # The flowing correspond to this instruction
                f.write(f"{6*' '}{12*'-'} {index[0]} {12*'-'}\n")
                if (inputs == "others"):
                    f.write(f"{6*' '}when {inputs} =>\n")
                else:
                    f.write(f"{6*' '}when \"{inputs}\" =>\n")
                assign_variables(f, vhdl_vars_dict, row, f"{8*' '}")

            # Close the case statement
            if (next_state_change):
                f.write(f"{4*' '}end case;\n")

    f.write(f"\nend case;")


if __name__ == "__main__":

    # Path to the excel file
    excel_file_path = os.path.join(
        Path(os.path.dirname(__file__)).parent.absolute(),
        "truth_tables",
        "fsm.xlsx"
    )

    # Read the truth table from the excel file
    fsm = pd.read_excel(
        io=excel_file_path,
        sheet_name=pd.ExcelFile(excel_file_path).sheet_names,
        dtype=str,
        usecols="B:P",
    )

    # Create file to store the output
    print("> Creating vhdl cases...")

    if not os.path.exists("output"):
        os.makedirs("output")

    with open("./output/fsm.txt", "w") as f:
        # Format the truth table
        fsm_formated = format_case_table(fsm)

        # VHDL corresponding variables
        formatted_columns = fsm_formated.columns
        vhdl_vars_dict = {
            formatted_columns[0]: "current_state",
            formatted_columns[1]: "next_state",
            formatted_columns[2]: "input_aggregate",
            formatted_columns[3]: "ir_write",
            formatted_columns[4]: "reg_write",
            formatted_columns[5]: "ma_write",
            formatted_columns[6]: "mem_write",
            formatted_columns[7]: "flags_write",
            formatted_columns[8]: "pc_src",
            formatted_columns[9]: "pc_write",
        }

        print_case(f, fsm_formated, vhdl_vars_dict)

        f.close()

        print("Done!")
