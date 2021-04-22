defmodule Logger.MyLogger do
  def format(level, message, timestamp, metadata) do
    "time=#{timestamp} level=[#{level}] metadata=#{inspect(metadata)} message=#{message}\n"
  rescue
    _ -> "could not format: #{inspect({level, message, metadata})}"
  end
end
