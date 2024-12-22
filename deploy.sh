#!/bin/bash
cd /var/www/Project-based-exam-altschool || exit
git pull origin main  
sudo systemctl restart nginx 
