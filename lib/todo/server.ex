defmodule Todo.Server do
  use GenServer

  def start(name) do
    IO.puts("Starting TODO server for #{name}")

    GenServer.start(__MODULE__, name)
  end

  def add_entry(todo_server, new_entry) do
    GenServer.cast(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server, date) do
    GenServer.call(todo_server, {:get, date})
  end

  @impl GenServer
  def init(name) do
    {:ok, {name, Todo.Database.get(name) || Todo.List.new(name)}}
  end

  @impl GenServer
  def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
    new_list = Todo.List.add_entry(todo_list, new_entry)

    Todo.Database.store(name, new_list)
    # Since it's a cast (Fire and forget), there is no reply

    {:noreply, {name, new_list}}
  end

  @impl GenServer
  def handle_call({:entries, date}, _caller?, {name, todo_list}) do
    {
      :reply,
      Todo.List.entries(todo_list, date),
      # The "state" as the return to keep the "state"
      {name, todo_list}
    }
  end
end
