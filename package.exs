Expm.Package.new(
  name: "random",
  description: "Elixir port of Python 3 random module.",
  version: File.read!("VERSION") |> String.strip,
  licenses: [[name: "MIT"]],
  keywords: ["random", "math", "elixir"],
  maintainers: [
    [name: "Yuce Tekol", email: "yucetekol@gmail.com"]
  ],
  repositories: [
    [git: "git@bitbucket.org:yuce/random.git"],
    [github: "yuce/random"]
  ]
)
