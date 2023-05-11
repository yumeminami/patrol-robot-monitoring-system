import pandas as pd
from openpyxl import Workbook
from openpyxl.utils.dataframe import dataframe_to_rows
from openpyxl.styles import Font


def flatten_dict(d, parent_key="", sep="_"):
    items = []
    for k, v in d.items():
        new_key = parent_key + sep + k if parent_key else k
        if isinstance(v, dict):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        elif isinstance(v, list):
            items.append((new_key, ", ".join(str(i) for i in v)))
        else:
            items.append((new_key, v))
    return dict(items)


def write_excel(data, filename):
    # Flatten the list of dictionaries and convert it to a pandas DataFrame
    if isinstance(data, dict):
        data = [data]
    flattened_data = [flatten_dict(d) for d in data]
    df = pd.DataFrame(flattened_data)

    # Create a new Workbook
    wb = Workbook()
    ws = wb.active

    # Write the DataFrame to the worksheet
    for r in dataframe_to_rows(df, index=False, header=True):
        ws.append(r)

    # Set the font to Calibri and font size to 12 for all cells
    font = Font(name="Calibri", size=12)
    for row in ws.iter_rows():
        for cell in row:
            cell.font = font

    # Set the column width
    for column_cells in ws.columns:
        length = max(len(str(cell.value)) for cell in column_cells)
        ws.column_dimensions[column_cells[0].column_letter].width = max(
            12, length
        )

    # Save the workbook to an Excel file
    wb.save(filename)


# data_single_dict = {"column1": 1, "column2": "A", "column3": 4.5}
# write_excel(data_single_dict, "output_single_dict.xlsx")
