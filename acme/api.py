# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import Flask, request
from .api_handler import ApiHandler

app = Flask(__name__)
api_handler = ApiHandler()


@app.route("/", methods=['GET'])
def get_message():  # pylint: disable=E0211
    return api_handler.handle('GET', '/', request)


@app.route("/", methods=['POST'])
def set_message():  # pylint: disable=E0211
    return api_handler.handle('POST', '/', request)
