# Random

This module contains pseudo-random number generators for various distributions ported from Python 3 `random` module. The documentation below is adapted from that module as well.

For integers, there is uniform selection from a range. For sequences, there is uniform selection of a random element, a function to generate a random permutation of a list in-place, and a function for random sampling without replacement.

On the real line, there are functions to compute uniform, normal (Gaussian), lognormal, negative exponential, gamma, and beta distributions. For generating distributions of angles, the von Mises distribution is available.

Almost all module functions depend on a Erlang `:random.uniform` function wrapper, which generates a random float uniformly in the semi-open range `[0.0, 1.0)`.

[Documentation](http://yuce.github.io/random/)

## Examples

    iex(1)> Random.randint(10, 20)
    14
    iex(2)> Random.sample 0..10000, 4
    [4436, 5015, 7231, 9459]


