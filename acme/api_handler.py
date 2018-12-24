# -*- coding: utf-8 -*-

"""Handle incoming API requests."""


class ApiHandler():
    """API backend."""

    def __init__(self):
        self.message = ''

    def handle(self, operation, *args, **kwargs):
        """Dispatch incoming API requests."""
        if operation is 'GET_MESSAGE':
            return self.message
        elif operation is 'POST_MESSAGE':
            self.message = self.get_value(kwargs, 'message')
            return self.message

    def get_value(self, kwargs, value):
        try:
            value = kwargs[value]
            return str(value).strip() if value else ''
        except KeyError:
            return ''
