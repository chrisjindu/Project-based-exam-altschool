# Project-based-exam-altschool
This is my second Semester Project in AltSchool Africa.
Project Documentation

Provisioning and Hosting My Web Server on AWS
 
Step 1:
Logging In and Setting Up the Instance.

I logged in to my AWS account and navigated to the EC2 dashboard.
I selected London as my region and created a new EC2 instance named Uduh-Project.

Step 2:
Configuring The Instance.

I chose Ubuntu as the machine image (AMI).
Selected the Free Tier T2-micro option for the instance type.

Step 3:
Security Group and Key-Pair.

I created a new security group to configure firewall rules.
Added the security group to my instance.
Selected a previously created key-pair for secure login.

Step 4:
Launching and Connecting to the Instance.

Launched the instance and navigated to the Connect button.
Copied the public DNS from the SSH client option.
Opened Termius, navigated to the directory containing my key-pair, and connected to the instance by pasting the SSH command from AWS.
Then i successfully logged into the Ubuntu machine.


Step 5:
Linking My GitHub Repository to the Server

Installed Git on the instance using the command:
 sudo apt install git -y

Step 6:
Generating and Adding SSH Key.

Generated an SSH key on the instance
 ssh-keygen

Step 7:
Copied the public key.

 cat ~/.ssh/id_ed25519.pub
Added the public key to my GitHub repository by navigating to Settings > SSH and GPG Keys > Add New Key.


Step 8:
Cloning the Repository.

Cloned the GitHub repository to the server
 git clone <Project-based-exam-altschool>


Step 9:
Installing NGINX and Hosting My Web Page

Updated all packages
sudo apt update

Installed NGINX
sudo apt install nginx -y

Step 10:
Started the server.
sudo systemctl start nginx
verified NGINX status

Step 11:
Deploying the Website.


Moved the project directory to the NGINX web root
sudo mv altSchool/* /var/www/html


Updated the NGINX configuration to point to the root directory
sudo nano /etc/nginx/sites-available/default


Restarted the NGINX server
 sudo systemctl restart nginx


Step 12:
Automating Deployment Updates and Creating a Deployment Script

Created a Bash script to pull updates from GitHub.
 nano ~/deploy.sh


Script contents:

 #!/bin/bash
cd /var/www/html
git pull origin main
sudo systemctl restart nginx


Made the script executable
 chmod +x ~/deploy.sh

Step 13:
Accessing the Website.

I accessed the website using the public IP of my instance 13.40.222.127

Step 14:
Adding a Custom Domain Name.
Registering the Domain

Registered a free domain name chriscool.mooo.com using freedns.afraid.org and pointed it to the public IP of my instance.
Configuring NGINX for the Domain

Updated the NGINX configuration
 server_name chriscool.mooo.com www.chriscool.mooo.com;

Restarted the server:
 sudo systemctl restart nginx


Step 15
Configuring HTTPS with a Free SSL Certificate.
Installing Certbot

Updated packages and installed Certbot with the NGINX plugin:
 sudo apt update
sudo apt install certbot python3-certbot-nginx -y

Step 16
Obtaining an SSL Certificate.

Ran the following command to secure the domain
 sudo certbot --nginx -d chriscool.mooo.com

Step 17
Testing the Configuration.

Verified the configuration
 sudo nginx -t

Restarted the NGINX server
 sudo systemctl reload nginx

Step 18
Accessing the Secure Website.

Confirmed that the website was accessible at https://chriscool.mooo.com



Conclusion
This project involved provisioning an AWS EC2 instance, linking a GitHub repository for updates, hosting a website using NGINX, adding a custom domain, and securing it with HTTPS. Each step was carefully executed, ensuring a reliable and secure deployment for the website.