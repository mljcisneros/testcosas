#!/bin/bash

##verifico la interface de default por la que va a salir el paquete
interface=$(ip route show|grep defaul| awk '{print $5}')

 ## Creo el archivo csv preliminar para que sea llenado por el escaneo
  touch flare.csv
  touch datos.pcap
  echo id,value > flare.csv


while true; do
 
## realizo el escaneo del trafico y completo el archivo
 timeout 10s tcpdump -i $interface  -nnnt -e icmp[icmptype]=8 -w datos.pcap
 tcpdump -i $interface -nnnt -e icmp[icmptype]=8 -r datos.pcap |sort | awk '{arr[$11]+=1} END {for (i in arr) {print i,",", arr[i]}}' >> flare.csv

done
