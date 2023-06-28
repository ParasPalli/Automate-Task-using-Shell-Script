
echo "1: Converting text to pdf"
echo "2: Update the packages"
echo "3: Backup the File"
echo "4: Memory Management or Resizing the Memory"
echo "5: Zip a file"
echo "6: Find File"
echo "7: Download file from URL"

read user_input


if [ $user_input == "1" ]
then

	# Converting text to pdf
	echo "Enter the filename"
	read txt_file
	enscript -p output.ps $txt_file.txt
	ps2pdf output.ps $txt_file.pdf
	open $txt_file.pdf
	rm output.ps
	echo "Done"


elif [ $user_input == "2" ]
then

	# Updating the all the packages with latest version...
	sudo apt-get update
	sudo apt-get upgrade
	echo "Done"


elif [ $user_input == "3" ]
then
	# Backuping the Files....
	echo "Enter the filename"
	time="$(date +'%d-%m-%y')"
	read file_name
	echo $file_name
	sudo tar -cvpzf ./backup/$file_name-$time.tar.gz $file_name
	open /home/ubantu/Desktop/backup


elif [ $user_input == "4" ]
then

	# Memory Management....
	gparted



elif [ $user_input == "5" ]
then

	# Zip a File....
	echo "Enter the filename"
	read file_name
	sudo tar -cvpzf ./$file_name.tar.gz $file_name

	# c: Used to create a tar archive...
	# v: Used to display verbose information
	# p: Preserves the permissions of the files put in the archive for restoration later....
	# z: Compressed gzip archive file...
	# f: Name the archive...



elif [ $user_input == "6" ]
then

	# Find File
	echo "Enter file name you want to search"
	read file_name
	sudo find / -type f -iname "$file_name*"



elif [ $user_input == "7" ]
then

	# Download file from url
	echo "Enter file Url"
	read url
	echo "-------------------------------"
	echo "Enter the filename to save as"
	read file_name
	
	curl $url -o $file_name

	echo "Done"
	open $file_name


fi
