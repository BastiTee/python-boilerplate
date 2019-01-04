# -*- coding: utf-8 -*-

import pytest
from my_module.api_handler import ApiHandler, ApiOperations


class TestApiHandler:

    def test_get(self):
        api_handler = ApiHandler()
        assert api_handler.handle(ApiOperations.MESSAGE_GET) == ''

    @pytest.mark.parametrize('set_message,expected', [
        ('test-message', 'test-message'),
        (None, ''),
        ('   test message       ', 'test message')
    ])
    def test_post(self, set_message, expected):
        api_handler = ApiHandler()
        api_handler.handle(ApiOperations.MESSAGE_POST, message=set_message)
        assert api_handler.handle(ApiOperations.MESSAGE_GET) == expected
