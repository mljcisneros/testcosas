#!/usr/bin/python

import os
import subprocess


testing_host=["mdzol.com.ar","google.com","googlnada.com","pepito.com"]


while True:
 for host in testing_host:
	rest = subprocess.Popen(["fping", host], stdout=subprocess.PIPE).stdout.read()
	if 'alive' in str(rest):
	 print(host+": is alive")
	else:
	 print(host+": no responde")
