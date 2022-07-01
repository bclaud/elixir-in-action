defmodule Todo.Server do
  use GenServer

  def start(name) do
  end

  def add_entry(todo_server, new_entry) do
  end

  def entries(todo_server, date) do
  end

  @impl GenServer
  def init(name) do
  end

  @impl GenServer
  def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
  end

  def handle_call({:entries, date}, _caller?, {name, todo_list}) do
  end
end
