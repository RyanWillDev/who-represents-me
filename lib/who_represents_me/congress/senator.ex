defmodule WRM.Congress.Senator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "senators" do
    field :phone, :string
    field :api_uri, :string
    field :date_of_birth, :date
    field :last_updated, :string
    field :last_name, :string
    field :fec_candidate_id, :string
    field :url, :string
    field :middle_name, :string
    field :total_present, :integer
    field :total_votes, :integer
    field :ideal_point, :integer
    field :next_election, :string
    field :rss_url, :string
    field :missed_votes, :integer
    field :google_entity_id, :string
    field :twitter_account, :string
    field :senate_class, :string
    field :office, :string
    field :leadership_role, :string
    field :party, :string
    field :icpsr_id, :string
    field :facebook_account, :string
    field :crp_id, :string
    field :state_rank, :string
    field :gender, :string
    field :votesmart_id, :string
    field :youtube_account, :string
    field :cspan_id, :string
    field :ocd_id, :string
    field :propublica_id, :string
    field :fax, :string
    field :lis_id, :string
    field :seniority, :string
    field :votes_with_party_pct, :float
    field :govtrack_id, :string
    field :title, :string
    field :in_office, :boolean, default: false
    field :dw_nominate, :float
    field :state, :string
    field :contact_form, :string
    field :first_name, :string
    field :suffix, :string
    field :missed_votes_pct, :float

    timestamps()
  end

  @doc false
  def changeset(senator, attrs) do
    senator
    |> cast(attrs, [
      :propublica_id,
      :title,
      :api_uri,
      :first_name,
      :middle_name,
      :last_name,
      :suffix,
      :date_of_birth,
      :gender,
      :party,
      :leadership_role,
      :twitter_account,
      :facebook_account,
      :youtube_account,
      :govtrack_id,
      :cspan_id,
      :votesmart_id,
      :icpsr_id,
      :crp_id,
      :google_entity_id,
      :fec_candidate_id,
      :url,
      :rss_url,
      :contact_form,
      :in_office,
      :dw_nominate,
      :ideal_point,
      :seniority,
      :next_election,
      :total_votes,
      :missed_votes,
      :total_present,
      :last_updated,
      :ocd_id,
      :office,
      :phone,
      :fax,
      :state,
      :senate_class,
      :state_rank,
      :lis_id,
      :missed_votes_pct,
      :votes_with_party_pct
    ])
    |> validate_required([])
  end
end
