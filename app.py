import mysql.connector
import time

def db_conn():
    hostname = 'localhost'
    username = 'admin'
    password = 'password'
    database = 'Warehouse_Database'
    conn = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
    return conn

import mysql

# connection global object
conn = db_conn()

def sleep_helper():
    time.sleep(0.5)

def signup():
    cur = conn.cursor()
    print("\nSignup\n")
    print("Please Enter your details")

    while True:
        cust_name = input("Enter Your Full Name : ")
        email = input("Enter your email : ")
        password = input("Enter new password : ")
        phone = int(input("Enter phone number : "))
        address1 = input("Enter your complete address : ")

        cur.execute(f'SELECT * FROM user WHERE email="{email}"')
        found = cur.fetchone()
        if found is None:
            # print(found)
            break
        print(f"\nA user alreay has an account with the email -> {email}")
        print("Please Try again with another email\n")

        # print(cust_name, email, password, address1)
    cur.execute(f'SELECT MAX(cust_id) FROM customer')

    cf = cur.fetchone()[0]
    if cf is None:
        cust_id = 0
    else:
        cust_id = int(cf) + 1
    # print("cust_id new id : ", cust_id)

    insert_user_query = f'INSERT INTO user VALUES("{email}", "{cust_name}", "{password}");'
    cur.execute(insert_user_query)

    insert_customer_query = f'INSERT INTO customer VALUES({cust_id},"{cust_name}", "{email}", "{phone}", "{address1}");'
    cur.execute(insert_customer_query)

    conn.commit()

    return cust_id, cust_name

def login():
    print("\nLogin into portal using email and password")
    while True:
        email = input("\nEnter email : ")
        password = input("Enter password : ")
        cur = conn.cursor()
        cur.execute(f'SELECT * FROM user WHERE email="{email}" AND password="{password}"')
        found = cur.fetchone()
        if found is not None:
            cur.execute(f'SELECT * FROM customer WHERE email="{email}"')
            cust_row = cur.fetchone()
            return cust_row[0], cust_row[1]
        else:
            print("!!! Error in email or password")
            print("!!! Please Try Again.")

def login_or_signup():
    print("--> Please login with email and password ? Or signup")
    los = input('\n--> Enter "login" or "signup" : ')
    if los == "login":
        return login()
    elif los == "signup":
        return signup()
    else:
        print(f"\n!!! Cannot understand your message {los}")
        print("!!! Please Try Again.")

def display_warehouse():

    print("\nItems available in warehouse are : \n")
    cur = conn.cursor()
    print("===============================================")
    print(f'{"Product Name":^16} {"Price":^16} {"Units":^16}')
    print("===============================================")

    cur.execute("SELECT warehouse.product_name, product_price, unit_type from warehouse, product WHERE warehouse.product_id=product.product_id")
    products = cur.fetchall()
    for pname, pprice, ptype in products:
        print(f'{pname:^16} {pprice:^16} {ptype:^16}')
    print("===============================================")

def show_order_from_customer(cust_id):
    cur = conn.cursor()

    cur.execute(f"SELECT order_id, product_name, product_qty, total_price FROM order_info WHERE order_info.cust_id={cust_id}")
    products = cur.fetchall()
    if len(products) == 0:
        time.sleep(1)
        print("\n\nYou do not have any orders yet! Please order")
        return False
    time.sleep(1)

    print("\nYour orders : \n")
    print("======================================================================")
    print(f'{"Order ID":^16} {"Product Name":^16} {"Qty ":^16} {"Price":^16}')
    print("======================================================================")
    for oid, pname, qty, price in products:
        print(f'{oid:^16} {pname:^16} {qty:^16} {price:^16}')
    print("======================================================================")
    return True

def take_order_from_customer(cust_id):
    print("\n\n--> Please select an item to order.")
    display_warehouse();

    while (True):
        pname = input("Enter the product name to order : ")
        # print(pname)

        cur = conn.cursor()
        cur.execute(f'SELECT warehouse.product_name, warehouse.product_id, product_price, unit_type from warehouse, product WHERE warehouse.product_id=product.product_id AND warehouse.product_name="{pname}"')
        products = cur.fetchall()
        if len(products) != 0:
            # print(products)
            pname, pid, pprice, ptype = products[0]
            
            print(f'\n--> How many units of {pname} do you want to order ? ')
            print(f'--> Each {ptype} costs {pprice}$')
            qty = float(input("Enter quantity : "))

            total_price = float(pprice) * float(qty)
            print(f"\n--> {qty} {ptype} of {pname} totals costs to : {total_price:.2f}$.")
            print("--> Do you want to confirm the order")

            yn = input("Enter yes or no : ")
            if yn == "yes":
                cur.execute(f'SELECT MAX(order_id) FROM order_info')
                cf = cur.fetchone()[0]
                if cf == None:
                    order_id = 0
                else:
                    order_id = int(cf) + 1
                # print("Order max id : ", order_id)
                insert_order = f'INSERT INTO order_info values({order_id}, {cust_id}, {pid}, "{pname}", {qty}, {pprice}, {total_price});'
                cur.execute(insert_order)
                conn.commit()

                # print(insert_order)

                print("\n--> Order placed succesfully! Thank you")
                show_order_from_customer(cust_id)
            else:
                print("\n--> Thank you for not ordering")
            break
        else:
            print(f"\n\n!!! {pname} product not found in warehouse. Please enter correct product name.\n")

def cancel_order_from_customer(cust_id):
    prev_order = show_order_from_customer(cust_id)
    if prev_order:
        while True:
            oid = input("\n\nEnter order id to cancel : ")
            cur = conn.cursor()
            cur.execute(f"SELECT order_id FROM order_info WHERE order_id={oid} AND cust_id={cust_id}")
            ores = cur.fetchone()
            if ores is None:
                print(f"\n!!!Order with order id : {ores} is not found")
                print("Please try again")
            else:
                cur.execute(f"DELETE FROM order_info WHERE order_id={oid}")
                conn.commit()
                print(f"order {oid} has been cancelled successfull\n")
                
                break

def main():
    sleep_helper()
    print("****************************************************************************")
    print("  Welcome to Online Ordering site and warehouse managment application")
    print("****************************************************************************")
    cid, cname = login_or_signup()

    sleep_helper()
    print("\n\n********************************")
    print(f"Welcome {cname} !! [{cid}]")
    print("********************************")
    sleep_helper()

    while(True):
        sleep_helper()
        print("\n\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        print(f'{"# Use one of the following commands to interact #":^61} \n')
        print(f'> warehouse: Displays all the products available in warehouse')
        print(f'> order: To order a product from warehouse')
        print(f'> list: To list out all your previous orders')
        print(f'> cancel: To cancel previous order')
        print(f'> exit: To exit from the program')
        print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        print()
        sleep_helper()
        ord_str = input("Enter command : ")
        if ord_str == "warehouse":
            display_warehouse()
        elif ord_str == "order":
            take_order_from_customer(cid)
        elif ord_str == "list":
            show_order_from_customer(cid)
        elif ord_str == "cancel":
            cancel_order_from_customer(cid)
        elif ord_str == "exit":
            break
        else: 
            print("\n input error ")
    conn.close()

main()