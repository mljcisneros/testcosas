#!/bin/bash

## SE crea el archivo para que se pueda guardar los datos del escaneo
touch datos.pcap

##SE genera el archivo de donde va a leer el grafico
touch data.tsv
echo date$'\t'close > data.tsv
while true; do

## Se realiza el escaneo del trafico del puerto 53
    timeout 60s tcpdump -i any  -nnnt dst port 53 -w datos.pcap
    tcpdump -i any -nnnt dst port 53 -r datos.pcap |echo $(date +%H:%M)$'\t'$(wc -l) >> data.tsv
done
