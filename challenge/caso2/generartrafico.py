#!/usr/bin/python

import os
import subprocess


testing_host=["127.0.0.1","google.com","github.com","googlnada.com"]
while True:
    for host in testing_host:
       rest = subprocess.Popen(["fping",host],stdout=subprocess.PIPE).stdout.read()
