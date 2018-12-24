# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import Flask, request
from .api_handler import ApiHandler

app = Flask(__name__)
api_handler = ApiHandler()
api_handler.handle('POST_MESSAGE', message='Hello world!')  # initial message


@app.route("/", methods=['GET'])
def get_message():  # pylint: disable=E0211
    return api_handler.handle('GET_MESSAGE')


@app.route("/", methods=['POST'])
def set_message():  # pylint: disable=E0211
    return api_handler.handle('POST_MESSAGE',
                              message=request.args.get('message'))
