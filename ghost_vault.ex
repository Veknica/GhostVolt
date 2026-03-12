defmodule GhostVolt do
  @moduledoc "Ultra-fast, zero-persistence RAM store. Data so fresh it evaporates."
  def start_link do
    :ets.new(:vault, [:set, :public, :named_table])
    IO.puts "⚡ GhostVolt Online: 0ms Latency (Memory-Only)"
  end
  def commit(key, value) do
    :ets.insert(:vault, {key, value})
    {:ok, "Committed to the void."}
  end
  def peek(key) do
    case :ets.lookup(:vault, key) do
      [{^key, val}] -> {:ok, val}
      [] -> {:error, "Data ghosted you."}
    end
  end
end
