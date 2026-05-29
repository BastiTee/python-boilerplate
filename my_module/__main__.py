"""Module main-file.

A module's __name__ is set equal to '__main__' when read from standard input,
a script, or from an interactive prompt.
"""

from my_module import greet


def main() -> None:
    """Entry point for the CLI."""
    print(greet('World'))


if __name__ == '__main__':
    main()
