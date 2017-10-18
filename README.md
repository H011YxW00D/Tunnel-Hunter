# Tunnel-Hunter

Tunnel-Hunter is a simple quick and dirty ssh tunnel tool written in bash that can be used as a standalone tool or be used in Red Team engagements on devices such as Pi's that are dropped to gain an internal foothold. There are two scripts:

1. Tunnel-Hunter.sh - The script that sits system that will be connecting back to you (Pi). It searches common ports that are allowed outbound e.g 80, 443, 53, 22 etc. until it finds one. Once it finds one it will use it to establish the tunnel.

2. Tunnel-Connect.sh - Ran on your C2 server used to connect you to the tunnel and back to the device. 

Setting Up:
1. You will need to add your host into the host variable in Tunnel-Hunter.sh.

2. Current ports that it will try: 22, 21, 25, 53, 80, 110, 143, 443, 465, 587, 993, 995, 3128, 3389, 5060, 5500, 8443, 1494, 8080. (If you edit these, make sure they match in each script. ;)

3. SSH can listen on multiple ports so adjust your sshd_config accordingly.

4. For Red Teams setting up a cron job to run Tunnel-Hunter.sh every minute to make sure the tunnel is up is ideal. To do this do the following: sudo crontab -e (select your editor if prompted) and enter the following: 

*/1 * * * * ~/create_ssh_tunnel.sh > tunnel.log 2>&1

5. Make sure you have created an SSH key and this setup properly.

