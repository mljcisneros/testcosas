#!/bin/bash


while true; do
    timeout 60s tcpdump eth0 -nnnt dst port 53 -w datos.pcap
    tcpdump eth0 -nnnt dst port 53 -r datos.pcap |echo $(date +%H:%M) $(wc -l) >> data.tsv
done
