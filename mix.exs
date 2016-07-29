defmodule Random.Mixfile do
  use Mix.Project

  def project do
    [ app: :random,
      version: "0.3.0",
      elixir: ">= 1.1.0",
      name: "Random",
      description: description,
      package: package,
      deps: deps
    ]
  end

  defp description do
    """
    This module contains pseudo-random number generators for various distributions ported from Python 3 random module for Elixir.
    """
  end

  defp package do
    [maintainers: ["Yuce Tekol"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/yuce/random",
              "Docs" => "http://yuce.me/random/"}]
  end

  defp deps do
    [{:tinymt, "~> 0.3.1"}]
  end
end
