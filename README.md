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
