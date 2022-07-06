defmodule Todo.List do
  defstruct auto_id: 1, entries: %{}

  @type entry :: %{id: pos_integer(), date: Date.t(), title: String.t()}
  @type t :: %__MODULE__{auto_id: pos_integer, entries: [entry()]}

  @spec new(entries :: [entry()] | nil) :: %__MODULE__{}
  def new(entries \\ []) do
    Enum.reduce(entries, %__MODULE__{}, fn entry, acc -> add_entry(acc, entry) end)
  end

  def size(todo_list) do
    map_size(todo_list.entries)
  end

  @spec add_entry(todo_list :: t(), entry()) :: t()
  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)

    %__MODULE__{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  @spec entries(todo_list :: t(), date :: Date.t()) :: [entry()] | []
  def entries(todo_list, date) do
    for {_id, entry} <- todo_list.entries, entry.date == date, do: entry
  end

  @spec all_entries(todo_list :: t()) :: [entry()] | []
  def all_entries(todo_list) do
    for {_id, entry} <- todo_list.entries, do: entry
  end

  @spec update_entry(todo_list :: t(), new_entry :: entry()) :: t()
  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  @spec update_entry(todo_list :: t(), entry_id :: pos_integer(), updater_fun :: fun()) :: t()
  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %__MODULE__{todo_list | entries: new_entries}
    end
  end

  @spec update_entry(todo_list :: t(), entry_id :: pos_integer()) :: t()
  def delete_entry(todo_list, entry_id) do
    %__MODULE__{todo_list | entries: Map.delete(todo_list.entries, entry_id)}
  end
end
