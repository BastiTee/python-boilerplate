# -*- coding: utf-8 -*-

"""Holds the application's state."""


class AppState():

    def __init__(self):
        self.message = 'Hello world!'

    def set_message(self, message):
        self.message = '' if not message else message

    def get_message(self):
        return self.message
