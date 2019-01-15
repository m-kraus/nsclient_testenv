#!/bin/bash

PREFIX=~/devel/_myplugins/check_nsc_web/build/darwin/amd64
#CURLOPTS=-v


#curl ${CURLOPTS} -k -H 'password: password' 'https://127.0.0.1:18443/query/ps_command?Start-Sleep%20-s%2025%3B%20Write-Host%20%27ran%20command%27' &
#${PREFIX}/check_nsc_web -k -u https://127.0.0.1:18443 -t 30 -p password -x "1slow $i" ps_command "Start-Sleep -s 25; Write-Host 'ran command'" &
curl ${CURLOPTS} -k -H 'password: password' 'https://127.0.0.1:38443/query/ps_command?Start-Sleep%20-s%2025%3B%20Write-Host%20%27ran%20command%27' &
#${PREFIX}/check_nsc_web -k -u https://127.0.0.1:38443 -t 30 -p password -x "3slow $i" ps_command "Start-Sleep -s 25; Write-Host 'ran command'" &
for i in {1..10}; do
    #curl ${CURLOPTS} -k -H 'password: password' 'https://127.0.0.1:18443/query/check_version' &
    #${PREFIX}/check_nsc_web -k -u https://127.0.0.1:18443 -t 30 -p password -x "1fast $i" check_version &
    curl ${CURLOPTS} -k -H 'password: password' 'https://127.0.0.1:38443/query/check_version' &
    #${PREFIX}/check_nsc_web -k -u https://127.0.0.1:38443 -t 30 -p password -x "3fast $i" check_version &
done
