RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok

export PATH="/usr/local/bin:$PATH"

echo "${GREEN}Visit ${YELLOW}https://dashboard.ngrok.com/get-started/setup/linux ${GREEN}to get auth-token${RESET}"
echo "${GREEN}Enter auth command below:${RESET}"
read command
$command

screen -dmS "ngrok-mc" "ngrok tcp 25565"
echo "${GREEN}Use ${YELLOW}\"screen -r ngrok\" ${GREEN}to view your ngrok IP${RESET}"