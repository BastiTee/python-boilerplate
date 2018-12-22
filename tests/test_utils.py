# -*- coding: utf-8 -*-

import pytest
from acme.utils import (add)


class Test:

    def test_add(self):
        """Ensure that adding yields correct results."""
        assert add(1,2) == 3
