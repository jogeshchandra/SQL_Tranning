# importing required
import mysql.connector
from mysql.connector import Error
import pandas as pd

# print("hello")

# connect to mysql server


def create_server_connection(host_name, user_name, user_password):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name, user=user_name, password=user_password
        )
        print("database connection has been done")
    except Error as er:
        print(f"Error : '{er}'")
    return connection
pw="Mysql@bnt12"
db="Group_activity1"
connection = create_server_connection("localhost","root",pw)


#creating database

def create_database (connection,query):
    cursor=connection.cursor()
    try:
        cursor.execute(query)
        print("Database created")
    except Error as er:
        print(f"Error :'{er}'")
database_create_query="CREATE DATABASE Group_activity1"
create_database(connection,database_create_query)
 

#connect to database

def create_db_conncetion(host_name,user_name,user_password,db_name):
    connection=None
    try:
        connection=mysql.connector.connect(host=host_name,user=user_name, password=user_password,database=db_name)
        print("database connetion done")
    except Error as er:
        print(f"Error : '{er}'")
    return connection

#execute sql qurey

def excecute_query(connection,query):
    cursor=connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query was succesful")
    except Error as er:
        print(f"Error :'{er}'")

create_table_query="""create table Student(
                    id int,
                    Name varchar(20),
                    Marks int,
                    Result varchar(20));"""
connection=create_db_conncetion("localhost","root",pw,db)
excecute_query(connection,create_table_query)