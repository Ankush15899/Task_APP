# README
1- First of all check if mysql is setup is present on your system or not.
2- If not then install the mysql with the following command and create new user with password for creating database.
	1- sudo apt install mysql-server (This will install the mysql client as well)
	2- CREATE USER 'task_root'@'localhost' IDENTIFIED BY 'taskApp';
	3- CREATE USER 'global_root'@'%' IDENTIFIED BY 'globaltaskApp';
	4- GRANT ALL PRIVILEGES ON *.* TO 'task_root'@'localhost';

3- Clone the repo and rename the database yml example file.
4- And create the database with rails db:create and then rails db:migrate or you can use rails db:setup.
5- Now run rails db:seed for some example data.
6- Generate your secret_key_base, first create the credentials.yml.enc file if you don't have or just run
	1- EDITOR=code rails credentials:edit and then
	2- rails credentials:edit
	3- Add secret_key_base: your_encrypted_secret_key_here
	After adding the desired secrets, save the file and close the text editor.
7- Now test the apis.
