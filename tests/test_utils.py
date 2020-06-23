# -*- coding: utf-8 -*-
"""Basic test suite."""

from my_module.utils import add_two_numbers

import pytest


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
