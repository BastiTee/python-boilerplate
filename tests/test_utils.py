# -*- coding: utf-8 -*-

import pytest
from acme.utils import (add)


class TestUtils:

    def test_add(self):
        """Ensure that adding yields correct results."""
        assert add(1, 2) == 3
        assert add(2, 1) == 3

    @pytest.mark.parametrize('var1, var2', [
        (None, 1), (1, None), (None, None)
    ])
    def test_add_None(self, var1, var2):
        """Ensure that adding None values raises ValueError."""
        with pytest.raises(ValueError):
            add(var1, var2)
