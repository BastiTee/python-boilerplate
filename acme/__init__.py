# -*- coding: utf-8 -*-

"""Acme sample module.

:copyright: (c) 2019 by Basti Tee.
:license: Apache 2.0, see LICENSE for more details.
"""

from .api import *
from logging import getLogger, NullHandler

# Set default logging handler to avoid "No handler found" warnings.
getLogger(__name__).addHandler(NullHandler())
