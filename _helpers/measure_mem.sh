#!/bin/bash

SERVER2012=192.168.33.10
SERVER2008=192.168.33.11

for i in {1..500}; do
    MEM2008="$(./check_nsc_web -k -u https://${SERVER2008}:8443 -p password -j check_process process=nscp.exe "warn=working_set >200m" | jq '.payload[0].lines[0].perf[] | select(.alias=="nscp.exe ws_size") |  .float_value.value')"
    echo ${MEM2008}
    curl -XPOST 'http://192.168.33.12:8086/write?db=nsc&u=omdadmin&p=omd' --data-binary "nscp.exe,host=2008,method=webserver value=${MEM2008}"
    MEM2012="$(./check_nsc_web -k -u https://${SERVER2012}:8443 -p password -j check_process process=nscp.exe "warn=working_set >200m" | jq '.payload[0].lines[0].perf[] | select(.alias=="nscp.exe ws_size") |  .float_value.value')"
    echo ${MEM2012}
    curl -XPOST 'http://192.168.33.12:8086/write?db=nsc&u=omdadmin&p=omd' --data-binary "nscp.exe,host=2012,method=webserver value=${MEM2012}"

    for i in {1..20}; do
        ./check_nsc_web -k -u https://${SERVER2012}:8443 -p password check_cpu > /dev/null 2>&1
        ./check_nsc_web -k -u https://${SERVER2008}:8443 -p password check_cpu > /dev/null 2>&1
        ./check_nsc_web -k -u https://${SERVER2012}:8443 -p password check_memory > /dev/null 2>&1
        ./check_nsc_web -k -u https://${SERVER2008}:8443 -p password check_memory > /dev/null 2>&1
    done

done
