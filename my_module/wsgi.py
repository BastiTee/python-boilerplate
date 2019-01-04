# -*- coding: utf-8 -*-
"""Handler to initialize application via uwsgi."""

from . import create_app

app = create_app()
