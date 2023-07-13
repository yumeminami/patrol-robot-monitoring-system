import pandas as pd
from openpyxl import Workbook
from openpyxl.styles import Font
from openpyxl.utils.dataframe import dataframe_to_rows

from app.schemas.cn_key_map import key_map, value_map


def flatten_dict(d):
    items = []
    for k, v in d.items():
        new_key = key_map.get(k, k)
        if isinstance(v, dict):
            items.extend(flatten_dict(v).items())
        elif isinstance(v, list):
            value_list = []
            for item in v:
                try:
                    if isinstance(item, dict):
                        item = flatten_dict(item)
                    else:
                        item = flatten_dict(vars(item))
                except Exception as e:
                    print(e)
                finally:
                    value_list.append(item)
            print(value_list)
            items.append((new_key, ",".join(str(i) for i in value_list)))
        else:
            new_value = value_map.get(v, v)
            items.append((new_key, new_value))

    return dict(items)


def write_excel(data, filename):
    # Flatten the list of dictionaries and convert it to a pandas DataFrame
    flattened_data = [flatten_dict(d) for d in data]
    df = pd.DataFrame(flattened_data)

    # Create a new Workbook
    wb = Workbook()
    ws = wb.active

    # Write the DataFrame to the worksheet
    for r in dataframe_to_rows(df, index=False, header=True):
        ws.append(r)  # type: ignore

    # Set the font to Calibri and font size to 12 for all cells
    font = Font(name="Calibri", size=12)
    for row in ws.iter_rows():  # type: ignore
        for cell in row:
            cell.font = font

    # Set the column width
    for column_cells in ws.columns:  # type: ignore
        length = max(len(str(cell.value)) for cell in column_cells)
        ws.column_dimensions[column_cells[0].column_letter].width = max(  # type: ignore
            12, length
        )

    # Save the workbook to an Excel file
    wb.save(filename)
