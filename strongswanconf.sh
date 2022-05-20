#!/bin/bash

echo "Starting strongswan configuation"
apt-get install strongswan -y
read -p "Are you on rtr-r(1) or rtr-l(2)" place
if [[ $place=1 ]]; then
  wget https://raw.githubusercontent.com/Arioxss/bash-test/footest/rtrrstrongswan
  mv rtrrstrongswan ipsec.conf
  mv ipsec.conf /etc/ipsec.conf
else
  wget https://raw.githubusercontent.com/Arioxss/bash-test/footest/rtrlstrongswan
  mv rtrlstrongswan ipsec.conf
  mv ipsec.conf /etc/ipsec.conf
fi

echo -e "4.4.4.100  5.5.5.100 : PSK \"P@ssw0rd\""

systemctl enable --now ipsec
