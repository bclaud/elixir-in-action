defmodule Todo.CacheTest do
  use ExUnit.Case

  test "server_process" do
    Todo.System.start_link()
    bob_pid = Todo.Cache.server_process("bob")

    assert bob_pid != Todo.Cache.server_process("alice")
    assert bob_pid == Todo.Cache.server_process("bob")
  end

  test "todo operations" do
    Todo.System.start_link()

    alice = Todo.Cache.server_process("alice")

    Todo.Server.add_entry(alice, %{date: ~D[2020-01-01], title: "Doc"})
    entries = Todo.Server.entries(alice, ~D[2020-01-01])

    assert [%{date: ~D[2020-01-01], title: "Doc"}] = entries
  end
end
