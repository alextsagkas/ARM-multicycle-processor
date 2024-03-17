import os
import re
from pathlib import Path
from typing import TextIO

import numpy as np
import pandas as pd


def format_table(
    data: pd.DataFrame,
) -> np.ndarray:
    """Format the truth table to be used in LaTeX tabular environment. The actions it 
    performs on data are the following:

    - For the titles:
        1. Convert everything to strings.
        2. Remove the bit fields from columns (they are obvious from the following rows).
        3. Remove the spaces from the titles.
        4. Make the titles bold.
    - For the values:
        1. Convert everything to strings.
        2. Replace _ with \_ for LaTeX.
        3. Replace # with \# for LaTeX.
        4. Remove space from comma-separated values.
        5. Remove spaces when words are separated with "/".
        6. Join the cells with &.
        7. Add the \\ at the end of the row.

    Args:
        data (pd.DataFrame): DataFrame containing the truth table.

    Returns:
        np.ndarray: Formatted truth table.
    """
    #! Titles
    # Excel columns
    columns = data.columns
    # Convert everything to strings
    columns = np.array(columns, dtype=np.str_)

    # Needed for variable length of the strings
    columns_formatted = np.array(columns, dtype=object)
    for index, row in enumerate(columns):
        # If Instruction multicol

        # Remove the r"\[.*\]" from the titles
        row = re.sub(r"\[[0-9]:[0-9]\]", "", row)
        # Remove the spaces from the titles
        row = re.sub(r"\s", "", row)
        # Make the titles bold
        row = re.sub(r"^(.*)", r"\\textbf{\1}", row)
        columns_formatted[index] = row
    # Assign the formatted columns to the original columns
    columns = np.array(columns_formatted, dtype=np.str_)

    #! Values
    # Convert everything to strings
    data_table = np.array(data, dtype=np.str_)
    # Stack Columns above the first row
    data_table = np.vstack((columns, data_table))

    # Needed for variable length of the strings
    data_table_formatted = np.zeros(shape=data_table.shape[0], dtype=object)
    for index, row in enumerate(data_table):
        # Replace _ with \_ for LaTeX
        row = [
            re.sub(r"_", r"\\_", cell)
            for cell in row
        ]
        # Replace # with \# for LaTeX
        row = [
            re.sub(r"#", r"\\#", cell)
            for cell in row
        ]
        # Remove space from comma-separated values
        row = [
            re.sub(r",\s", ",", cell)
            if re.search(r",\s", cell)
            else cell
            for cell in row
        ]
        # Remove spaces when words are separated with "/"
        row = [
            re.sub(r"\s/\s", "/", cell)
            if re.search(r"\s/\s", cell)
            else cell
            for cell in row
        ]
        # Add the & between the cells
        row = " & ".join(row)
        # Add the \\ at the end of the row
        row += " \\\\"
        data_table_formatted[index] = row
    # Assign the formatted table to the original table
    data_table = np.array(data_table_formatted, dtype=np.str_)

    return data_table


def latex_table(
    f: TextIO,
    instr_dec_table: np.ndarray,
    label: str,
    caption: str,
) -> None:
    """Write a LaTeX table generated from the instr_dec_table to the file f. Also,
    add the label and the caption to the table. The scale parameter is used to optionally 
    scale the table to fit the page.

    Args:
        f (TextIO): File to write the table.
        instr_dec_table (np.ndarray): Table to write to the file.
        label (str): Label of the LaTeX table.
        caption (str): Caption of the LaTeX table.
    """
    length = len(re.findall(r"&", instr_dec_table[0])) + 1

    # Create table
    f.write("\\begin{table}[ht]\n")
    f.write("\\centering\n")
    f.write(f"\\caption{{{caption}}}\n")
    f.write(f"\\label{{tab:{label}}}\n")
    # Scale the table to fit the page
    f.write("\\begin{adjustbox}{width=\\columnwidth, center}\n")
    # Begin the tabular environment
    f.write("\\begin{tabular}")
    # Typewriter font
    f.write("{*{")
    f.write(f"{length}")
    f.write("}{>{\\ttfamily}c}")
    f.write("}\n")
    # Horizontal line
    f.write("\\toprule\n")

    for index, row in enumerate(instr_dec_table):
        # Add the row to the file
        f.write(f"{row}\n")

        if index == 0:
            # Add the \hline at the end of the first row
            f.write("\\midrule\n")
        elif index == len(instr_dec_table) - 1:
            # Add the \hline at the end of the last row
            f.write("\\bottomrule\n")

    # Close the opened environments
    f.write("\\end{tabular}\n")
    f.write("\\end{adjustbox}\n")
    f.write("\\end{table}\n")


if __name__ == "__main__":

    #! Instruction Decoder

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
    )

    instr_dec_table = format_table(instr_dec)

    with open("../report/Tables/instr_dec.tex", "w") as f:
        print(f"> Creating instr_dec.tex")
        latex_table(
            f=f,
            instr_dec_table=instr_dec_table,
            label="instr_dec",
            caption="Πίνακας αλήθειας του Instruction Decoder.",
        )

    f.close()

    #! FSM
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
    )

    # Create a list of files to output the tables
    files = []
    for sheet in fsm.keys():
        file_name = "fsm_" + sheet + ".tex"
        files.append(file_name)

    # Create a tuple of array of tuples (label, caption, scale)
    infos = [
        ("fsm_ldr", "Πίνακας προσδιορισμού κατάστασης για την εντολή LDR."),
        ("fsm_str", "Πίνακας προσδιορισμού κατάστασης για την εντολή STR."),
        ("fsm_dp", "Πίνακας προσδιορισμού κατάστασης για τις εντολές DP."),
        ("fsm_cmp", "Πίνακας προσδιορισμού κατάστασης για την εντολή CMP."),
        ("fsm_br", "Πίνακας προσδιορισμού κατάστασης για την εντολή B."),
    ]

    for index, sheet in enumerate(fsm):
        fsm_sheet = fsm[sheet]
        fsm_table = format_table(fsm_sheet)

        with open(f"../report/Tables/{files[index]}", "w") as f:
            print(f"> Creating {files[index]}")
            latex_table(
                f=f,
                instr_dec_table=fsm_table,
                label=infos[index][0],
                caption=infos[index][1],
            )

        f.close()

    #! Program

    # Path to the excel file
    excel_file_path = os.path.join(
        Path(os.path.dirname(__file__)).parent.absolute(),
        "truth_tables",
        "program.xlsx"
    )

    # Read the truth table from the excel file
    program = pd.read_excel(
        io=excel_file_path,
        dtype=str,
    )

    program_table = format_table(program)

    with open("../report/Tables/program.tex", "w") as f:
        print(f"> Creating program.tex")
        latex_table(
            f=f,
            instr_dec_table=program_table,
            label="proram",
            caption="Τιμές αρτηριών για κάθε εντολή του προγράμματος σε γλώσσα assembly που εκτελείται στον επεξεργαστή.",
        )

    f.close()
