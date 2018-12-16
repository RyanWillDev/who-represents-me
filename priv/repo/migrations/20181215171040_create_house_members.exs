defmodule WRM.Repo.Migrations.CreateHouseMembers do
  use Ecto.Migration

  def change do
    create table(:house_members) do
      add :first_name, :string
      add :title, :string
      add :google_entity_id, :string
      add :facebook_account, :string
      add :phone, :string
      add :date_of_birth, :date
      add :geoid, :string
      add :fax, :string
      add :ocd_id, :string
      add :last_name, :string
      add :district, :string
      add :propublica_id, :string
      add :middle_name, :string
      add :crp_id, :string
      add :youtube_account, :string
      add :icpsr_id, :string
      add :ideal_point, :integer
      add :total_votes, :integer
      add :api_uri, :string
      add :short_title, :string
      add :suffix, :string
      add :at_large, :boolean, default: false, null: false
      add :dw_nominate, :float
      add :missed_votes_pct, :float
      add :govtrack_id, :string
      add :party, :string
      add :next_election, :string
      add :state, :string
      add :twitter_account, :string
      add :senority, :string
      add :fec_candidate_id, :string
      add :office, :string
      add :votesmart_id, :string
      add :votes_with_party_pct, :float
      add :cspan_id, :string
      add :url, :string
      add :rss_url, :string
      add :last_updated, :string
      add :in_office, :boolean, default: false, null: false
      add :gender, :string
      add :leadership_role, :string
      add :total_present, :integer
      add :contact_form, :string

      timestamps()
    end

  end
end
