defmodule Random.Mixfile do
  use Mix.Project

  def project do
    [ app: :random,
      version: File.read!("VERSION") |> String.strip,
      elixir: ">= 1.1.0",
      name: "Random",
      description: description,
      package: package
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
end
