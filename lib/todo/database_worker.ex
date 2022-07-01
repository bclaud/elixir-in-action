defmodule Todo.DatabaseWorker do
  use GenServer

  defmodule Todo.DatabaseWorker do
    def start(db_folder) do
    end

    def store(worker_pid, key, data) do
    end

    def get(worker_pid, key) do
    end

    @impl GenServer
    def init(db_folder) do
    end

    @impl GenServer
    def handle_cast({:store, key, data}, db_folder) do
    end

    @impl GenServer
    def handle_call({:get, key}, _caller?, db_folder) do
    end

    defp filename(db_folder, key) do
    end
  end
end
