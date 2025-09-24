# User Creation Script for Ubuntu
This script automates the creation of user accounts on an Ubuntu system from a list in a text file. Follow the steps below to use the script and create multiple users.

## Prerequisites
- Make sure you have `sudo` privileges to run administrative commands.
- Ensure that the script `ubuntu_users.sh` and the user list file are in the same directory.

## Instructions
### 1. Place the Files in the Same Directory
Ensure that both the script file `importubuntuusers.sh` and the text file containing the list of users are in the same directory.
   
### 2. Grant Execution Permissions to the Script
To make the script executable, run the following command in your terminal.

```bash
sudo chmod u+x importubuntuusers.sh
```

### 3. Execute the Script
Run the script using sudo to ensure it has the necessary permissions to create users.

```bash
sudo ./importubuntuusers.sh
```

### 4. Verify User Creation
After running the script, you can verify that the users were created successfully by checking the `/etc/passwd` file. Run the following command:

```bash
cat /etc/passwd
```

This will display a list of all user accounts on the system. Check that the 12 users automatically created appear in the list.
