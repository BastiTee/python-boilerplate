# -*- coding: utf-8 -*-

import pytest
from acme.api_handler import ApiHandler


class TestApiHandler:

    def test_get(self):
        api_handler = ApiHandler()
        assert api_handler.handle('GET_MESSAGE') == ''

    @pytest.mark.parametrize('set_message,expected', [
        ('test-message', 'test-message'),
        (None, ''),
        ('   test message       ', 'test message')
    ])
    def test_post(self, set_message, expected):
        api_handler = ApiHandler()
        api_handler.handle('POST_MESSAGE', message=set_message)
        assert api_handler.handle('GET_MESSAGE') == expected
