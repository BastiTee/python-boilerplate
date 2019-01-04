# -*- coding: utf-8 -*-

"""Handle incoming API requests."""

from .utils import get_kwarg_value_or_empty
from enum import Enum
import logging


class ApiHandler():
    """API backend."""

    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.logger.info('Initializing API handler...')
        self.message = ''

    def handle(self, operation, *args, **kwargs):
        """Dispatch incoming API requests."""
        if operation is ApiOperations.MESSAGE_GET:
            return self.message

        if operation is ApiOperations.MESSAGE_POST:
            self.message = get_kwarg_value_or_empty(kwargs, 'message')
            return self.message


class ApiOperations(Enum):

    MESSAGE_GET = 1
    MESSAGE_POST = 2
