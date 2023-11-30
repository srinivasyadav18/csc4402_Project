# csc4402 Project 

## Online Ordering and Warehouse Database Management System


[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/srinivasyadav18/csc4402_Project?quickstart=1&devcontainer_path=.devcontainer%2Fdevcontainer.json)

### Steps to run the code

- Step 1. Start the GitHub Code Spaces(click on above button), then click on create new codespace, then this will open up VS Code in browser in a new tab running an Ubuntu container.
- Step 2. Open terminal.
- Step 3. Run `source setup.sh` in terminal. This step will install **mysql**, **mysql python interface** and creates new a user in **mysql-server** that will be used to run python CLI application. **NOTE THIS WILL TAKE 5-7 mins to setup**
- Step 4. After all the setup is done, Run `python app.py` to interact with the CLI Application Interface.

#### More information
- The default email and password for the CLI application is : `email= user@gmail.com  & password= password`
- `mysql` command should always be run as `sudo`.
- The tests are in `test.sql` file. To run all the tests perform this commad : `sudo mysql < test.sql` 
- To test manually, Open mysql by running command `sudo mysql` and copy paste each query from test.sql.


### Code Content:
- **Database relations with constraints (2 points). You must submit the database file(s) based on the chosen platform. You can use any relational database management system to create your database. We highly recommend either SQLite or MySQ**L.

The Database schema resides in `warehouse_db.sql` file.

- **Data (2 points). Your database file must contain data and not just schemas. We do not expect you to use real data. Feel free to generate synthetic data using a script. You must provide the script if you choose to do so**.

The data for DB is in `data.sql`

- **Test queries (2 points). You will have to provide us with a set of 5 test queries to check if your database is working as expected. The test queries must be provided in an executable file**.

The test queries are in `test.sql`

- **Application user interfaces (2 points). You will need to provide the code for your application user interfaces. There are no restrictions on the platform you can use**.

The Application interface is in `app.py`. To interact with it, please run `python app.py`

- **Readme/Instructions (2 points): You must provide us with detailed documentation on how to run your database, application user interface code and execute test queries. Note that if we are unable to run your code, you will only be partially graded**.

This is the `README` file.
