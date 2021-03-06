defmodule Bunt do
  use Application

  alias Bunt.ANSI

  @version Mix.Project.config[:version]

  def puts, do: puts("")
  def puts(nil), do: puts("")
  def puts(text) when is_binary(text), do: text |> IO.puts
  def puts(list) when is_list(list) do
    list
    |> List.flatten
    |> ANSI.format
    |> IO.puts
  end

  def start(_, _), do: {:ok, self}

  def version, do: @version

end
