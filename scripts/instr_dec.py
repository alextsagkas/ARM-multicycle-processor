import os
from pathlib import Path
from typing import TextIO

import numpy as np
import pandas as pd


def start_case(
    f: TextIO,
    op: np.str_,
    funct: np.str_
) -> None:
    """Start the case statement in the file f. It uses the op and funct
    to write the case statement.

    Args:
        f (TextIO): File to write the vhdl cases (prefered .txt).
        op (np.str_): Operation code of the instruction.
        funct (np.str_): Function code of the instruction.
    """
    if op == "--":
        f.write(f"  when others =>\n")
    else:
        f.write(f"  when \"{op}{funct}\" =>\n")


def generate_variables(
    funct: np.str_,
) -> np.ndarray:
    """Generates the binary numbers for the function code. It replaces
    the "-" in the function code with all the binary numbers of the same
    length. It is assumed that the "-" are at the end of the function code.

    Args:
        funct (np.str_): Function code with "-" in the end.

    Returns:
        np.ndarray: Array of all the function codes with the "-" replaced.
    """
    funct_dash_pos = np.char.find(funct, "-")
    if funct_dash_pos == -1 or funct_dash_pos == 0:
        return np.array([funct])

    bin_numbers_len = len(funct) - funct_dash_pos
    funct_array = np.array([])

    # Generate all the binary numbers of length bin_numbers_len
    for i in range(2 ** bin_numbers_len):
        bin_number = format(i, f"0{bin_numbers_len}b")
        funct_array = np.append(
            funct_array,
            funct[:funct_dash_pos] + bin_number
        )

    return funct_array


def assign_variables(
    f: TextIO,
    vhdl_vars: list[str],
    row: np.ndarray,
) -> None:
    """Assigns the vhdl variables to the corresponding values in the
    truth table. It uses the vhdl_vars to name the corresponding output
    variables.

    Args:
        f (TextIO): File to write the vhdl cases (prefered .txt).
        vhdl_vars (list[str]): VHDL variables to be used in the cases.
        row (np.ndarray): Row of the truth table.
    """
    for var, col in zip(vhdl_vars, row[3:]):
        if len(col) == 1:
            f.write(f"    {var} <= \'{col}\';\n")
        else:
            f.write(f"    {var} <= \"{col}\";\n")


def print_case(f: TextIO,
               instr_dec_table: np.ndarray,
               vhdl_vars: list[str]) -> None:
    """Prints in file the vhdl cases from the instr_dec_table. It
    uses the vhdl_vars to name the corresponding output variables.

    Args:
        f (TextIO): File to write the vhdl cases (prefered .txt).
        instr_dec_table (np.ndarray): Truth table with the instructions.
        vhdl_vars (list[str]): VHDL variables to be used in the cases.
    """
    f.write("case op_funct is \n")

    for row in instr_dec_table:
        op = row[1]
        funct = row[2]

        f.write(f"  -- {row[0]}\n")

        funct_array = generate_variables(funct)

        for funct in funct_array:
            start_case(f, op, funct)
            assign_variables(f, vhdl_vars, row)

    f.write("end case;")


def print_testbench(
        f: TextIO,
        instr_dec_table: np.ndarray,
        vhdl_vars: list[str]) -> None:
    """Prints in file the testbench for the vhdl cases from the instr_dec_table. It
    uses the vhdl_vars to name the corresponding output variables.

    Args:
        f (TextIO): File to write the vhdl cases (prefered .txt).
        instr_dec_table (np.ndarray): Truth table with the instructions.
        vhdl_vars (list[str]): VHDL variables to be used in the cases.
    """
    for row in instr_dec_table:
        op = row[1]
        funct = row[2]

        if op == "--":
            break

        f.write(f"-- {row[0]}\n")
        f.write("test( \n")
        f.write(f"  op => \"{op}\",\n")
        f.write(f"  funct => \"{funct}\",\n")

        for index, (var, col) in enumerate(zip(vhdl_vars, row[3:])):
            if len(col) == 1:
                f.write(f"  {var}_correct => \'{col}\'")
            else:
                f.write(f"  {var}_correct => \"{col}\"")

            if index < len(vhdl_vars) - 1:
                f.write(",\n")

        f.write(");\n")


if __name__ == "__main__":

    # Path to the excel file
    excel_file_path = os.path.join(
        Path(os.path.dirname(__file__)).parent.absolute(),
        "truth_tables",
        "instr_dec.xlsx"
    )

    # Read the truth table from the excel file
    instr_dec = pd.read_excel(
        io=excel_file_path,
        sheet_name='instructions',
        dtype=str,
        usecols="A,B,C,E:K"
    )

    # Excel columns
    columns = instr_dec.columns
    # VHDL corresponding variables
    vhdl_vars = [
        "reg_src",
        "alu_src",
        "imm_src",
        "alu_control",
        "mem_to_reg",
        "no_write_in",
        "bl_in"
    ]

    # Remove spaces and convert X to -
    instr_dec_table = np.array(instr_dec, dtype=np.str_)
    instr_dec_formated = np.char.replace(np.char.replace(instr_dec_table[:, 1:], " ", ""), "X", "-")
    instr_dec_table = np.column_stack(([instr_dec_table[:, 0], instr_dec_formated]))

    # Create file to store the output
    if not os.path.exists("output"):
        os.makedirs("output")

    with open("./output/instr_dec.txt", "w") as f:
        print("Creating vhdl cases")
        print_case(f, instr_dec_table, vhdl_vars)

    f.close()

    # Create testbench file
    if not os.path.exists("testbench"):
        os.makedirs("testbench")

    with open("./testbench/instr_dec_tb.txt", "w") as f:
        print("Creating testbench file for vhd cases")
        print_testbench(f, instr_dec_table, vhdl_vars)

    f.close()
