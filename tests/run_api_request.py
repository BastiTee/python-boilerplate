#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Run GET and POST requests against the running acme Flask-application."""

from requests import get, post
from time import time

port = 9690
endpoint = 'http://localhost:' + str(port)

print('-- GET: Current message')
print(' > ', get(endpoint).text)

print('-- POST: New message ')
print(' > ', post(endpoint + '?message=message-' + str(int(time()))).text)

print('-- GET: Updated message')
print(' > ', get(endpoint).text)
