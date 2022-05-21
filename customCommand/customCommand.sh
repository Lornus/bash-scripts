#! /bin/bash

echo -e "Parameter(s): $@\n"

printHeader(){

echo -e "System information for $(hostname)\n Obtained by $(whoami)\n Machine ID: $(cat /etc/machine-id)\n"

}

printTime(){
echo -e "Date: $(timedatectl status)\n ---------------------------------------------------------------"
}

printOs(){
printHeader
echo "Kernel release $(uname -r)"
echo -e  "OS distro: $(cat /etc/os-release)\n  ---------------------------------------------------------------"

}

printHard(){

lscpu | grep ^CPU\(\s\)\

echo -e "Memory $(free -h)"

echo -e  "Disk $(lsblk -f | grep xvda)\n  ---------------------------------------------------------------"

}

printNet() {

echo "Privat IP: $(hostname -I)"

echo -e "Public IP: $(curl -4 icanhazip.com)\n  ---------------------------------------------------------------"

}

printLoggedUsers(){

echo -e  "Users: $(who)\n  ---------------------------------------------------------------"

}

printHelp() {

echo -e "$0 [-d] [-o] [-h] [-n] [-u] [--help]\n"

echo -e "Options:\n -d: Display a current time settings\n -o: Prints all information about OS\n -h: Displays a list of CPU, Memory, Disk\n -n: Displays a list of IPs"

echo -e " -u: Displays a list of logged users\n--help: Displays help info"

}

if [ "$#" -eq  "0" ]; 

then 
	echo -e "Empty parameters\n"
        printHelp

fi
main()
{
for argval in "$@"

do

    case $argval in
        "-d")
           printTime
            ;;
        "-o")

            printOs
            ;;

        "-h")
            printHard
            ;;
        "-n")

            printNet
     
            ;;
	"-u")
	printLoggedUsers
		;;
	"--help")
	printHelp
;;
        *)
	   echo -e "Invalid option: $argval\n"
            printHelp
        ;;
    esac
done

}

main "$@" 

