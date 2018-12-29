# -*- coding: utf-8 -*-

"""REST API routes."""

from flask import request


class ApiRoutes():

    def __init__(self, app, api_handler, api_operations):

        @app.route("/", methods=['GET'])
        def get_message():  # pylint: disable=W0612
            return api_handler.handle(
                api_operations.MESSAGE_GET
            )

        @app.route("/", methods=['POST'])
        def set_message():  # pylint: disable=W0612
            return api_handler.handle(
                api_operations.MESSAGE_POST,
                message=request.args.get('message')
            )
