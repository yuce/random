# Random

This module contains pseudo-random number generators for various distributionsp orted from Python 3 `random` module. The documentation below is adapted from that module as well.

For integers, there is uniform selection from a range. For sequences, there is uniform selection of a random element, a function to generate a random permutation of a list in-place, and a function for random sampling without replacement.

On the real line, there are functions to compute uniform, normal (Gaussian), lognormal, negative exponential, gamma, and beta distributions. For generating distributions of angles, the von Mises distribution is available.

Almost all module functions depend on the basic function random(), which generates a random float uniformly in the semi-open range [0.0, 1.0).

Documentation: http://yuce.tekol.net/elixir/random

## Examples

    iex(1)> Random.randint(10, 20)
    14
    iex(2)> Random.shuffle(1..6)
    [5, 4, 1, 6, 2, 3]

