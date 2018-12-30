#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Run GET and POST requests against the running acme Flask-application."""

from requests import get, post
from time import time


def err(exception):
    print('\033[91m ! ERROR:', exception, '\033[0m')


port = 9690
endpoint = 'http://localhost:' + str(port)

print('-- GET: Current message')
try:
    print(' > ', get(endpoint).text)
except Exception as e:
    err(e)

print('-- POST: New message ')
try:
    print(' > ', post(endpoint + '?message=message-' + str(int(time()))).text)
except Exception as e:
    err(e)

print('-- GET: Updated message')
try:
    print(' > ', get(endpoint).text)
except Exception as e:
    err(e)
