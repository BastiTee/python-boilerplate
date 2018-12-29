# -*- coding: utf-8 -*-

"""Handle incoming API requests."""

from .utils import get_kwarg_value_or_empty
import logging


class ApiHandler():
    """API backend."""

    def __init__(self):
        logger = logging.getLogger(__name__)
        logger.info('Initializing API handler...')
        self.message = ''

    def handle(self, operation, *args, **kwargs):
        """Dispatch incoming API requests."""
        if operation is 'GET_MESSAGE':
            return self.message
        elif operation is 'POST_MESSAGE':
            self.message = get_kwarg_value_or_empty(kwargs, 'message')
            return self.message
