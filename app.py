import mysql.connector

def db_conn():
    hostname = 'localhost'
    username = 'admin'
    password = 'password'
    database = 'Warehouse_Database'
    print( "Using mysql.connector:" )
    conn = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
    return conn

# connection global object
conn = db_conn()

def signup():
    cur = conn.cursor()
    print("\nSignup\n")
    print("Please Enter your details")

    while True:
        cust_name = input("Enter Your Full Name : ")
        email = input("Enter your email : ")
        password = input("Enter new password : ")
        address1 = input("Enter your complete address : ")

        cur.execute(f'SELECT * FROM user WHERE email="{email}"')
        found = cur.fetchone()
        if found is None:
            print(found)
            break
        print(f"\nA user alreay has an account with the email -> {email}")
        print("Please Try again with another email\n")

        print(cust_name, email, password, address1)
    cur.execute(f'SELECT * FROM user')
    all_rows = cur.fetchall()
    n_elements = len(all_rows)
    print("len : ", n_elements)

    insert_query = f'INSERT INTO user VALUES("{email}", "{cust_name}", "{password}");'
    print(insert_query)
    cur.execute(insert_query)
    conn.commit()
    
    cur.execute(f'SELECT * FROM user')
    print(cur.fetchall())

def login():
    print("\nLogin into portal using email and password")
    while True:
        email = input("\nEnter email : ")
        password = input("Enter password : ")
        print(email, password)
        cur = conn.cursor()
        cur.execute(f'SELECT * FROM user WHERE email="{email}" AND password="{password}"')
        found = cur.fetchone()
        if found is not None:
            print(found)
            break
        else:
                print("Try again")

def login_or_signup():
    print("\nDo you want to login with existing email and password ?")
    print("Or Do you want create a new account ?")
    los = input('\nEnter "login" or "signup" : ')
    print(los)
    if los == "login":
        login()
    elif los == "signup":
        signup()
    else:
        print(f"\nCannot understand your message {los}")
        print("Please Try Again!!")

def main():
    print("Starting application")
    login_or_signup()

    conn.close()

main()