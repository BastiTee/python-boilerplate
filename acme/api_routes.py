# -*- coding: utf-8 -*-
# pylint: disable=W0612

"""REST API routes."""

from flask import request
import logging
from time import time


class ApiRoutes():

    def __init__(self, app, api_handler, api_operations):

        self.logger = logging.getLogger(__name__)

        @app.route("/", methods=['GET'])
        def get_message():
            return api_handler.handle(
                api_operations.MESSAGE_GET
            )

        @app.route("/", methods=['POST'])
        def set_message():
            return api_handler.handle(
                api_operations.MESSAGE_POST,
                message=request.args.get('message')
            )

        @app.before_request
        def before_request():
            request.now = time()

        @app.after_request
        def after_request(response):
            runtime = round((time() - request.now)*1000, 2)
            content = [
                request.method,
                request.path,
                request.query_string.decode('utf-8'),
                request.remote_addr,
                str(response.status_code),
                '|',
                str(response.content_length),
                response.charset,
                response.content_type,
                '|',
                str(runtime) + ' ms'
            ]
            self.logger.info(' '.join(content))
            return response
