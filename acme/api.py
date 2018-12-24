# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import Flask, request
from .state import AppState

app = Flask(__name__)
app_state = AppState()


@app.route("/", methods=['GET'])
def get_message():  # pylint: disable=E0211
    return app_state.get_message() + '\n'


@app.route("/", methods=['POST'])
def set_message():  # pylint: disable=E0211
    message = request.args.get('message')
    app_state.set_message(message)
    return app_state.get_message() + '\n'
