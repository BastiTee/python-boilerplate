# -*- coding: utf-8 -*-

"""Acme sample module.

:copyright: (c) 2019 by Basti Tee.
:license: Apache 2.0, see LICENSE for more details.
"""

import logging
from flask import Flask
from .api_handler import ApiHandler
from .api_routes import ApiRoutes

logging.basicConfig(
    # See https://docs.python.org/3/library/logging.html#logrecord-attributes
    format='%(asctime)-15s %(levelname)s %(message)s [%(name)s.%(funcName)s]',
    level=logging.INFO
)


def create_app():
    """Flask application factory method."""
    logger = logging.getLogger(__name__)

    logger.info('Setting up Flask application...')
    app = Flask(__name__)
    ApiRoutes(app, ApiHandler())

    logger.info('Server successfully started.')
    return app
