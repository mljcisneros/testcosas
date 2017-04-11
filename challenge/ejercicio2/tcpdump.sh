#!/bin/bash


while true; do
    timeout 60s tcpdump -nnnt dst port 53 -w datos.pcap
    tcpdump -nnnt dst port 53 -r datos.pcap |echo $(date +%H:%M) $(wc -l) >> data.tsv
done