# -*- coding: utf-8 -*-

"""TODO
curl http://localhost:5000 && curl -XPOST "http:/localhost:5000?message=$( date +%s )" && curl http://localhost:5000
"""

# from rx import Observer
from .state import AppState


class ApiHandler():
    """API backend."""

    def __init__(self):
        self.app_state = AppState()

    def handle(self, http_method, path, request):
        """Dispatch incoming API requests."""
        print(http_method, ' >>> ', path, ' >>> ', request)

        if http_method is 'GET' and path is '/':
            return self.app_state.get_message() + '\n'
        elif http_method is 'POST' and path is '/':
            message = request.args.get('message')
            self.app_state.set_message(message)
            return self.app_state.get_message() + '\n'
