# -*- coding: utf-8 -*-
"""Module init-file.

A module's __name__ is set equal to '__main__' when read from standard input,
a script, or from an interactive prompt.
"""

import click

from my_module.utils import add_two_numbers


@click.command('my_module')
@click.option('--number-a', '-a', type=click.INT, default=2)
@click.option('--number-b', '-b', type=click.INT, default=2)
def main(number_a: int, number_b: int) -> None:
    """Enter main application."""
    print('Executed from command line...')
    print(f'2 + 2 equals {add_two_numbers(number_a, number_b)}')


if __name__ == '__main__':
    main()
