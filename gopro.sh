#
# gopro.sh
# Copyright (c) 2021 Dmitriy Borovikov. All rights reserved.
#
set -e
# Setup vars
GATEWAYIP=$(ip address show dev wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)
TARGETIP=$(ip route ls | grep "default.*wlan0" | awk '{print $3}')

# Cleanup
sudo iptables-legacy -t nat -N trident_cockpit_post || true
sudo iptables-legacy -N trident_cockpit_out || true
sudo iptables-legacy -t nat -F trident_cockpit_post
sudo iptables-legacy -F trident_cockpit_out
sudo iptables-legacy -t nat -D POSTROUTING -j trident_cockpit_post || true
sudo iptables-legacy -D OUTPUT -j trident_cockpit_out || true

# Provision
sudo iptables-legacy -t nat -A trident_cockpit_post -d $TARGETIP -j SNAT --to-source $GATEWAYIP
sudo iptables-legacy -A trident_cockpit_out -p icmp -j ACCEPT
sudo iptables-legacy -A trident_cockpit_out -s $GATEWAYIP -d 10.5.5.9 -j DROP

sudo iptables-legacy -t nat -I POSTROUTING -j trident_cockpit_post
sudo iptables-legacy -I OUTPUT -j trident_cockpit_out
