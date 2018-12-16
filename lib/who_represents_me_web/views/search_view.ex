defmodule WRMWeb.SearchView do
  use WRMWeb, :view

  def link_class(%{"party" => "Republican"}) do
    "text-republican-red"
  end

  def link_class(%{"party" => "Democratic"}) do
    "text-democrat-blue"
  end

  def link_class(%{"party" => _}) do
    "text-purple-dark"
  end

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
