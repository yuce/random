# Elixir Random module

This module contains pseudo-random number generators for various distributions ported from Python 3 `random` module for [Elixir](http://elixir-lang.org). The documentation below is adapted from that module as well.

For integers, there is uniform selection from a range. For sequences, there is uniform selection of a random element, a function to generate a random permutation of a list in-place, and a function for random sampling without replacement.

On the real line, there are functions to compute uniform, normal (Gaussian), lognormal, negative exponential, gamma, and beta distributions. For generating distributions of angles, the von Mises distribution is available.

Almost all module functions depend on a Erlang `:random.uniform` function wrapper, which generates a random float uniformly in the semi-open range `[0.0, 1.0)`.

[Project Homepage on BitBucket](https://bitbucket.org/yuce/random/)

[Project Homepage on GitHub](https://github.com/yuce/random/)

[Documentation](http://yuce.github.io/random/)

[Original Python 3 Documentation](http://docs.python.org/3/library/random.html)

## Examples

    iex(1)> Random.randint(10, 20)
    14
    iex(2)> Random.sample(0..10000, 4)
    [4436, 5015, 7231, 9459]
    iex(2)> {n, gauss_next} = Random.gauss(1, 2)
    {-2.0056082102271917, 0.5561885306380824}
    iex(3)> {n, gauss_next} = Random.gauss(1, 2, gauss_next)
    {2.112377061276165, nil}


