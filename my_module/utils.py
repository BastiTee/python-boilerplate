# -*- coding: utf-8 -*-
"""Utility functions."""


def add_two_numbers(number_left, number_right):
    """Add two numbers."""
    if not number_left:
        raise ValueError('Input number_left must be set.')
    if not number_right:
        raise ValueError('Input number_right must be set.')
    return number_left + number_right
