#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Run GET and POST requests against the running Flask-application."""

from requests import get, post
from time import time
import sys


def print_red(exception):
    print('\033[91m ! ERROR:', exception, '\033[0m')


def print_green(message):
    print('\033[32m >', message, '\033[0m')


host = 'localhost' if len(sys.argv) < 2 else sys.argv[1]
port = '9690' if len(sys.argv) < 3 else sys.argv[2]
endpoint = 'http://' + host + ':' + port

print('ENDPOINT:', endpoint)
print('GET: Current message')
try:
    print_green(get(endpoint).text)
except Exception as e:
    print_red(e)

print('POST: New message ')
try:
    print_green(post(endpoint + '?message=message-' + str(int(time()))).text)
except Exception as e:
    print_red(e)

print('GET: Updated message')
try:
    print_green(get(endpoint).text)
except Exception as e:
    print_red(e)
