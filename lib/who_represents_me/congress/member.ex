defmodule WRM.Congress.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :cspan_id, :string
    field :term, :integer
    field :chamber, :string
    field :date_of_birth, :date
    field :office, :string
    field :phone, :string
    field :api_uri, :string
    field :url, :string
    field :facebook_account, :string
    field :fec_candidate_id, :string
    field :twitter_account, :string
    field :govtrack_id, :string
    field :next_election, :string
    field :short_title, :string
    field :seniority, :string
    field :contact_form, :string
    field :last_name, :string
    field :last_updated, :string
    field :ocd_id, :string
    field :fax, :string
    field :icpsr_id, :string
    field :district, :string
    field :ideal_point, :integer
    field :in_office, :boolean, default: false
    field :geoid, :string
    field :youtube_account, :string
    field :propublica_id, :string
    field :crp_id, :string
    field :votesmart_id, :string
    field :first_name, :string
    field :rss_url, :string
    field :gender, :string
    field :party, :string
    field :title, :string
    field :suffix, :string
    field :middle_name, :string
    field :dw_nominate, :float
    field :state, :string
    field :at_large, :boolean, default: false
    field :google_entity_id, :string
    field :leadership_role, :string
    field :lis_id, :string
    field :senate_class, :string
    field :state_rank, :string
    field :missed_votes, :integer

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [
      :first_name,
      :title,
      :google_entity_id,
      :facebook_account,
      :phone,
      :date_of_birth,
      :geoid,
      :fax,
      :ocd_id,
      :last_name,
      :district,
      :propublica_id,
      :middle_name,
      :crp_id,
      :youtube_account,
      :icpsr_id,
      :ideal_point,
      :api_uri,
      :short_title,
      :suffix,
      :at_large,
      :dw_nominate,
      :govtrack_id,
      :party,
      :next_election,
      :state,
      :twitter_account,
      :seniority,
      :fec_candidate_id,
      :office,
      :votesmart_id,
      :cspan_id,
      :url,
      :rss_url,
      :last_updated,
      :in_office,
      :gender,
      :leadership_role,
      :contact_form,
      :senate_class,
      :state_rank,
      :missed_votes,
      :term,
      :chamber
    ])
    |> validate_required([])
  end
end
