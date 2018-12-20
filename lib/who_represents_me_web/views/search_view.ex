defmodule WRMWeb.SearchView do
  use WRMWeb, :view

  def social_link(%{"id" => id, "type" => "Facebook"}) do
    "https://facebook.com/" <> id
  end

  def social_link(%{"id" => id, "type" => "Twitter"}) do
    "https://twitter.com/" <> id
  end

  def social_link(%{"id" => id, "type" => "YouTube"}) do
    "https://youtube.com/" <> id
  end

  def social_link(%{"type" => _}) do
    ""
  end
end
