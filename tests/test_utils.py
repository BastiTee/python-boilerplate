# -*- coding: utf-8 -*-
"""Basic test suite.

There are some 'noqa: F401' in this file to just test the isort import sorting
along with the code formatter.
"""

import __future__  # noqa: F401

import json  # noqa: F401
from os import path  # noqa: F401
from re import IGNORECASE, sub  # noqa: F401

import my_module  # noqa: F401
from my_module.utils import add_two_numbers

import pytest
import requests  # noqa: F401


class TestUtils:  # noqa: D101

    @pytest.mark.parametrize('number_left, number_right', [
        (None, 1), (1, None), (None, None)
    ])
    def test_add_two_numbers_no_input(self, number_left, number_right):
        """Basic input validation."""
        with pytest.raises(ValueError):
            add_two_numbers(number_left, number_right)

    def test_add_two_numbers_regular_input(self):
        """Basic asserting test."""
        assert add_two_numbers(2, 3) == 5
