/*Use the pandas function read_sql_query() to assign to the variable df the DataFrame of results from the following query: 
select all records from PlaylistTrack INNER JOIN Track on PlaylistTrack.TrackId = Track.TrackId 
that satisfy the condition Milliseconds < 250000.*/


import pandas as pd
from sqlalchemy import create_engine
engine = create_engine("sqlite:///Chinook.sqlite")

# Execute query and store records in DataFrame: df
df = pd.read_sql_query("SELECT * FROM PlayListTrack INNER JOIN Track ON PlayListTrack.TrackId = Track.TrackId WHERE Milliseconds < 250000", engine)

# Print head of DataFrame
print(df.head())