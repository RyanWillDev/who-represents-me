defmodule WRMWeb.CongressMemberView do
  use WRMWeb, :view

  def display_name(%{"middle_name" => middle_name} = member) when not is_nil(middle_name) do
    [member.first_name, member.middle_name, member.last_name] |> Enum.join(" ")
  end

  def display_name(member) do
    [member.first_name, member.last_name] |> Enum.join(" ")
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

  def get_social_links(member) do
    [
      %{"id" => member.twitter_account, "type" => "Twitter"},
      %{"id" => member.facebook_account, "type" => "Facebook"},
      %{"id" => member.youtube_account, "type" => "YouTube"}
    ]
    |> Enum.filter(&(&1["id"] != nil))
  end

  def number_of_missed_votes(member) do
    (member.total_votes * (member.missed_votes_pct / 100)) |> Kernel.trunc()
  end
end
