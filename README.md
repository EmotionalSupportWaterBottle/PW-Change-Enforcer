# PW-Change-Enforcer

This PowerShell tool is designed for large scale environments to automate the password reset enforcement for many users at a time. Especially following an AD password security assessment in which hundreds or thousands of users may be using poor or breached passwords. 

Steps:
1. Copy the PowerShell script anywhere on your domain-joined system.
2. Put "Usernames.csv" in the same location as the PS script. Make sure all the users you want to force password changes for are listed in this file.
    a. You do not need to include the domain name in this file as the script runs under domain admin user privileges.
4. You might need to temporarily change the execution policy to allow the script to run, but change it back after (this should be set in group policy anyway)
5. Run the script as a domain admin
6. This didn't work for my test environment right away. I either had to run a gpupdate or wait a bit for the changes to take affect against my users.

Before running the script:
![image](https://github.com/user-attachments/assets/f5d6c91b-9ba6-427a-85a8-fff10c0994fa)

Here is what the .csv file has in my test environment (1 blank line, 1 valid user, 1 nonexistent user):
![image](https://github.com/user-attachments/assets/7afb5a2f-bba8-4c68-bb01-057220a9defb)

This is what it looks like when you run the script with a blank entry, a valid entry, and an invalid entry:
![image](https://github.com/user-attachments/assets/a9c8c1c0-6a03-48b6-a38b-8cbe267b4ccf)

This is the result of running the script:
![image](https://github.com/user-attachments/assets/a2531a41-69e2-4895-adf8-29a197624466)
