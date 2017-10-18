#!/bin/bash
echo ""
echo "  ______                       __      ______                            __" 
echo " /_  __/_  ______  ____  ___  / /     / ____/___  ____  ____  ___  _____/ /_"
echo "  / / / / / / __ \/ __ \/ _ \/ /_____/ /   / __ \/ __ \/ __ \/ _ \/ ___/ __/"
echo " / / / /_/ / / / / / / /  __/ /_____/ /___/ /_/ / / / / / / /  __/ /__/ /_  "
echo "/_/  \__,_/_/ /_/_/ /_/\___/_/      \____/\____/_/ /_/_/ /_/\___/\___/\__/ "
echo""
echo "Description: Searches for SSH Tunnels established by Tunnel-Hunter."
echo "Written by Shane Rudy aka @H011YxW00D aka BlueSp4ce"
echo "ara1212@gmail.com"
echo ""
findTunnel() {
for i in $( echo -e "21\n22\n23\n20\n25\n53\n80\n110\n143\n443\n465\n587\n993\n995\n3128\n3389\n5060\n5500\n8443\n1494\n8080\n" ); 
  do
    /usr/bin/ssh -o ConnectTimeout=5 root@localhost -p 5$i
  done
  if [[ $? -eq 0 ]]; then
    echo Tunnel found on port $i
  else
    echo No Tunnel found on port $i. RC was $?  
fi
}
/bin/pidof ssh
 echo "+-+-+-+-+-+-+-+ +-+-+-+ +-+ +-+-+-+-+-+-+"
 echo "|F|i|n|d|i|n|g| |A| |T|u|n|n|e|l|.|.|.|"
 echo "+-+-+-+-+-+-+-+ +-+-+-+ +-+ +-+-+-+-+-+-+"
 echo ""
 findTunnel
