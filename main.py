hostname = 'localhost'
username = 'admin'
password = 'password'
database = 'test_database'
print( "Using mysql.connector:" )

def doQuery( conn ) :
    cur = conn.cursor()

    cur.execute( "SELECT * FROM test_table" )

    for firstname, lastname in cur.fetchall() :
        print( firstname, lastname )

import mysql.connector
myConnection = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection )
myConnection.close()