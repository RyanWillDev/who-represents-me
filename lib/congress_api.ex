defmodule CongressApi do
  def get_result({_, %{"status" => "2" <> _status} = body}) do
    {:ok, body}
  end

  def get_result({_, %{"status" => "404"}}) do
    {:error, :not_found}
  end

  def get_result({_, body}) do
    {:error, body}
  end
end
