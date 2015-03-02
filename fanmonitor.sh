#!/bin/sh
i=1
btime=`date +%s`
#echo $btime

while [ $i -lt 5 ]
do
        ttime=`date +%s`
        value=`expr ${ttime} - ${btime}`
        #value=${ttime}-${btime}
        #echo "$value"
        if [ $value -gt 5 ]; then
                btime=$ttime
                #echo $i
                temp=`cat /sys/devices/virtual/thermal/thermal_zone0/temp`
                #echo $temp
                if [ $temp -gt 70000 ]; then
                        echo 1 > /sys/devices/virtual/thermal/cooling_device0/cur_state
                fi

                if [ $temp -lt 55000 ]; then
                        echo 0 > /sys/devices/virtual/thermal/cooling_device0/cur_state
                fi

         fi
sleep 1
done
