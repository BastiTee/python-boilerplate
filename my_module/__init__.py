"""my_module - A Python module template.

This module provides example functions demonstrating proper typing,
documentation, and testing patterns.
"""

__all__ = ['greet']


def greet(name: str) -> str:
    """Return a greeting message for the given name.

    Args:
        name: The name of the person to greet.

    Returns:
        A personalized greeting string.

    Example:
        >>> greet("World")
        'Hello, World!'
    """
    return f'Hello, {name}!'
