
from dataclasses import replace
from datetime import date
from multiprocessing.connection import Connection
import pyodbc as pyodbc
import pandas as pd
import matplotlib as mpl
from sqlite3 import SQLITE_SELECT, Cursor
import os
import openpyxl



def sql_connect ():
    con = pyodbc.connect('Driver={SQL Server};'
                          'Server=CAMSER-PC\MSSQLSERVER01;'
                          'Database=GELA;'
                          'Trusted_Connection=yes;')
    return con

def sql_select (table):
    s_quer = 'SELECT * FROM dbo.' + table
    return s_quer

wb = openpyxl.Workbook()
excel_dir = r'C:\Users\Thaer\Desktop\source\repos\GELA_DB\bin\app.publish\excel_export'
wb.save(excel_dir + '\GELA_data' + " " + date.today().strftime('%b %d, %Y') + '.xlsx')
with pd.ExcelWriter (excel_dir + '\GELA_data' + " " + date.today().strftime('%b %d, %Y') + '.xlsx',engine="openpyxl",mode='a', if_sheet_exists='replace') as writer:
    df_projects = pd.read_sql_query(sql_select('entry_tbl_project_data'),sql_connect())
    print(df_projects)
    print(type(df_projects))
    df_projects.to_excel(writer, sheet_name='projects list')

    df_customers = pd.read_sql_query(sql_select('entry_tbl_customers'),sql_connect())
    print(df_customers)
    print(type(df_customers))
    df_customers.to_excel(writer, sheet_name='customers list')

    df_order = pd.read_sql_query(sql_select('entry_tbl_order'),sql_connect())
    print(df_order)
    print(type(df_order))
    df_order.to_excel(writer, sheet_name='orders')

