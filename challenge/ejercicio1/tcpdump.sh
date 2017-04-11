#!/bin/bash


while true; do
  touch flare.csv
  echo id,value > flare.csv
  timeout 10s tcpdump -nnnt -e icmp[icmptype]=8 -w datos.pcap
  tcpdump -nnnt -e icmp[icmptype]=8 -r datos.pcap |sort | awk '{arr[$11]+=1} END {for (i in arr) {print i,",", arr[i]}}'>>flare.csv

done