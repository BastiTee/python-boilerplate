# -*- coding: utf-8 -*-

"""Acme sample module.

:copyright: (c) 2019 by Basti Tee.
:license: Apache 2.0, see LICENSE for more details.
"""

# Set default logging handler to avoid "No handler found" warnings.
import logging
from logging import NullHandler

logging.getLogger(__name__).addHandler(NullHandler())
