/*Assign to rs the results from the following query: select all the records, 
extracting the Title of the record and Name of the artist of each record from the Album table and the Artist table, 
respectively. To do so, INNER JOIN these two tables on the ArtistID column of both.
In a call to pd.DataFrame(), apply the method fetchall() to rs in order to fetch all records in rs. 
Store them in the DataFrame df.
Set the DataFrame's column names to the corresponding names of the table columns.*/




import pandas as pd
from sqlalchemy import create_engine
engine = create_engine('sqlite:///Chinook.sqlite')
/*Open engine in context manager
Perform query and save results to DataFrame: df*/
with engine.connect() as con:
    rs = con.execute("SELECT Album.Title, Artist.Name FROM Album INNER JOIN Artist ON Album.ArtistID = Artist.ArtistID")
    df = pd.DataFrame(rs.fetchall())
    df.columns = rs.keys()
    con.close()

/*Print head of DataFrame df*/
print(df.head())

/*
The SELECT statement retrieves the Title of each album from the Album table and 
the Name of each artist from the Artist table.
The FROM clause indicates that the primary data source is the Album table. 
The INNER JOIN clause specifies that this table should be joined with the Artist table, 
using the ArtistID column present in both tables to match records. 
The ArtistID acts as a key that connects the two tables, enabling the retrieval of combined information from both.
*/