defmodule CongressApi do
  def get_result({_, %{"status" => "2" <> _status} = body}) do
    {:ok, body}
  end

  def get_result({_, %{"status" => "OK", "results" => results}}) do
    {:ok, results}
  end

  def get_result({_, %{"status" => "404"}}) do
    {:error, :not_found}
  end

  def get_result({_, body}) do
    {:error, body}
  end

  def format_member_details(resolved_tasks) do
    resolved_tasks |> Enum.map(&(elem(&1, 1) |> elem(1))) |> Enum.reduce(&Map.merge/2)
  end
end
