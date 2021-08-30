# TicTacToe

This is my submission for my Recurse Center Application. The code aims to
demonstrate Object Oriented Design principles using Ruby, while avoiding an
over-architected solution.

## Installation

1. Make sure you have the correct Ruby version installed, as specified in the
`.ruby-version` file (we recommend using rbenv)
1. `gem install bundler`
1. `bundle install`

## Running the game

The user interface for this game is very basic. Simply enter the row and column
of the cell you wish to claim, separated by a space. "0 0" is the top-left cell
and "0 2" is the bottom-left, for example. A slicker user interface is room for
improvement in this program.

To start the game, just run `ruby lib/main_loop.rb`

## Running the tests

Just run `rake` (or alternatively `ruby -Ilib:test test/test_to_run.rb` if you
wish to make things harder for yourself)
