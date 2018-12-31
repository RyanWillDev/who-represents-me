defmodule WRM.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
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
      add :api_uri, :string
      add :short_title, :string
      add :suffix, :string
      add :at_large, :boolean, default: false, null: false
      add :dw_nominate, :float
      add :govtrack_id, :string
      add :party, :string
      add :next_election, :string
      add :state, :string
      add :twitter_account, :string
      add :seniority, :string
      add :fec_candidate_id, :string
      add :office, :string
      add :votesmart_id, :string
      add :cspan_id, :string
      add :url, :string
      add :rss_url, :string
      add :last_updated, :string
      add :in_office, :boolean, default: false, null: false
      add :gender, :string
      add :leadership_role, :string
      add :contact_form, :string
      add :chamber, :string
      add :term, :integer
      add :lis_id, :string
      add :senate_class, :string
      add :state_rank, :string
      add :missed_votes, :integer

      timestamps()
    end
  end
end
