# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import Flask, request
from .state import AppState

flask_app = Flask(__name__)
app_state = AppState()


@flask_app.route("/", methods=['GET'])
def get_message():  # pylint: disable=E0211
    return app_state.get_message() + '\n'


@flask_app.route("/", methods=['POST'])
def set_message():  # pylint: disable=E0211
    message = request.args.get('message')
    app_state.set_message(message)
    return app_state.get_message() + '\n'
