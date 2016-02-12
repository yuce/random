defmodule Random.Mixfile do
  use Mix.Project

  def project do
    [ app: :random,
      version: File.read!("VERSION") |> String.strip,
      elixir: ">= 1.1.0",
      name: "Random",
      source_url: "https://bitbucket.org/yuce/random/"]
  end

end
