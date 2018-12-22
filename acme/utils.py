# -*- coding: utf-8 -*-

"""Utility functions."""


def add(number_1, number_2):
    """Add two numbers."""
    if not number_1 or not number_2:
        raise ValueError('Input numbers must be set.')
    return number_1 + number_2
