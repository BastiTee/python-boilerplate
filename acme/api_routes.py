# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import request


class ApiRoutes():

    def __init__(self, app, api_handler):

        @app.route("/", methods=['GET'])
        def get_message():  # pylint: disable=E0211
            return api_handler.handle('GET_MESSAGE')

        @app.route("/", methods=['POST'])
        def set_message():  # pylint: disable=E0211
            return api_handler.handle(
                'POST_MESSAGE', message=request.args.get('message'))
