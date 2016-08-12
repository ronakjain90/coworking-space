ExUnit.start

Mix.Task.run "ecto.create", ~w(-r CoworkingSpace.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r CoworkingSpace.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(CoworkingSpace.Repo)

