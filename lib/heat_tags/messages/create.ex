defmodule HeatTags.Messages.Create do
  alias HeatTags.{Message,Repo}
  def call(params) do
    params
    |> Message.changeset()
    |> Repo.insert()
    |> handle insert()
  end

  defp handle_insert ({:ok, %Message{}} = result), do: result do
  defp handle_insert ({:error, result}), do: %{:error, %{result: result, status: :bad_request}}
end  