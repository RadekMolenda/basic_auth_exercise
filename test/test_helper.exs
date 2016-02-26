ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BasicAuthExercise.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BasicAuthExercise.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BasicAuthExercise.Repo)

