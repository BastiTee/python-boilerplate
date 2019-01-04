# -*- coding: utf-8 -*-

import pytest
from my_module.utils import (get_kwarg_value_or_empty)


class TestUtils:

    @pytest.mark.parametrize('kwarg, key', [
        (None, 1), (1, None), (None, None)
    ])
    def test_get_kwarg_value_or_empty_no_input(self, kwarg, key):
        with pytest.raises(ValueError):
            get_kwarg_value_or_empty(kwarg, key)

    @pytest.mark.parametrize('kwarg, key', [
        ({'foo': 'bar'}, 'foo'),
        ({'foo': '   bar        '}, 'foo')
    ])
    def test_get_kwarg_value_or_empty_regular_input(self, kwarg, key):
        assert get_kwarg_value_or_empty(kwarg, key) == 'bar'
