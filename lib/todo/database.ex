defmodule Todo.Database do
  use GenServer

  def start do
  end

  def store(key, data) do
  end

  def get(key) do
  end

  defp choose_worker(key) do
  end

  @impl GenServer
  def init(_) do
  end

  @impl GenServer
  def handle_call({:choose_worker, key}, _, workers) do
  end

  defp start_workers() do
  end
end
