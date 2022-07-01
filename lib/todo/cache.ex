defmodule Todo.Cache do
  use GenServer

  def start_link(_opts) do
  end

  def server_process(todo_list_name) do
    GenServer.call(__MODULE__, :server_process, todo_list_name)
  end

  @impl GenServer
  def init(_) do
  end

  @impl GenServer
  def handle_call({:server_process, todo_list_name}, _caller?, todo_servers) do
  end
end
