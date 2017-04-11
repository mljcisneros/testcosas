#!/usr/bin/python
import os
import subprocess
host="google.com"
while True:
	rest=subprocess.Popen(["nslookup.",host],stdout=subprocess.PIPE).stdout.read()
	