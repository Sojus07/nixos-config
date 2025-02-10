response=$(curl -s https://am.i.mullvad.net/json)
if [ $? -ne 0 ]; then
    exit 1
fi
server=$(echo "$response" | jq -r '.mullvad_exit_ip_hostname')
if [ "$server" != "null" ]; then
    echo "$server"
fi

