defmodule CivicApi do
  @key Application.get_env(:civic_api, :api_key)

  def key do
    @key
  end
end
