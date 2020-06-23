# -*- coding: utf-8 -*-
"""Utility functions."""


def get_kwarg_value_or_empty(kwargs, key):
    if not kwargs or not key:
        raise ValueError('Input kwargs or key must be set.')
    try:
        value = kwargs[key]
        return str(value).strip() if value else ''
    except KeyError:
        return ''
