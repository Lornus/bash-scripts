#! /bin/bash

ø
changeTimeZone() {
echo "Enter time zone"
read timeZone

timedatectl set-timezone $timeZone
echo "Timezone now is: "
timedatectl
}

changeHostName() {
echo "Enter new hostname: "
read hostName

hostnamectl set-hostname $hostName

echo "Hostname successfully changed to ${hostName}"
}

addUser() {
echo "Enter new username"
read username
if cut -d: -f1 /etc/passwd | grep "${username}"; then 
	echo "User already exists."
else
	useradd -m -s /bin/bash $username
	echo "Enter password for ${username}"
	passwd $username
	echo "User ${username} successfully created!"
fi
}

menu() {
while true

echo "Choose an option:"
echo "1 - Change time Zone"
echo "2 - Change host name"
echo "3 - Add new user"
echo "n - exit"

do
read option

    case $option in
        "1")
           changeTimeZone
            ;;
        "2")

            changeHostName
            ;;

        "3")
            addUser
            ;;
        "n")

            echo "Bye"
            exit
            ;;
        *)
            echo "Invalid option :("
        ;;
    esac
done

}
echo $(timedatectl status | grep "Time zone")
echo "Current hostname": $HOSTNAME
menu 
