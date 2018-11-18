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
end
