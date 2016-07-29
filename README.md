# Elixir Random module

This module contains pseudo-random number generators for various distributions
ported from Python 3 `random` module for [Elixir](http://elixir-lang.org).
The documentation below is adapted from that module as well.

> For integers, there is uniform selection from a range. For sequences, there is uniform
selection of a random element, a function to generate a random permutation of a list in-place,
and a function for random sampling without replacement.

> On the real line, there are functions to compute uniform, normal (Gaussian), lognormal,
negative exponential, gamma, and beta distributions. For generating distributions of angles,
the von Mises distribution is available.

## Documentation

* [Module documentation](http://yuce.github.io/random/)

* [Python 3 random module documentation](http://docs.python.org/3/library/random.html)


## Build

The only dependency is [TinyMT Erlang](https://github.com/jj1bdx/tinymt-erlang), which
is available on [hex.pm](https://hex.pm/packages/tinymt)

    $ mix get.deps
    $ mix

## Test

    $ mix test

## Usage

**Random** is available on [hex.pm](https://hex.pm/packages/random).
You neeed to include `{:random, "> 0.2.3"}` as a dependency in your project.

## Examples

    iex(1)> Random.randint(10, 20)
    14
    iex(2)> Random.sample(0..10000, 4)
    [4436, 5015, 7231, 9459]
    iex(3)> {n, gauss_next} = Random.gauss(1, 2)
    {-2.0056082102271917, 0.5561885306380824}
    iex(4)> {n, gauss_next} = Random.gauss(1, 2, gauss_next)
    {2.112377061276165, nil}

## Thanks

* [Kenji Rikitake](https://github.com/jj1bdx) pointed out a range error in the module and provided code which enables using his [TinyMT Erlang](https://github.com/jj1bdx/tinymt-erlang)
library to produce floats in `[0.0, 1.0)` range.

* [p2k](https://github.com/p2k) updated the project to be compatible with Elixir 1.2.
