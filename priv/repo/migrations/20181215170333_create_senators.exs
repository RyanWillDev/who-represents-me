defmodule WRM.Repo.Migrations.CreateSenators do
  use Ecto.Migration

  def change do
    create table(:senators) do
      add :propublica_id, :string
      add :title, :string
      add :api_uri, :string
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :suffix, :string
      add :date_of_birth, :date
      add :gender, :string
      add :party, :string
      add :leadership_role, :string
      add :twitter_account, :string
      add :facebook_account, :string
      add :youtube_account, :string
      add :govtrack_id, :string
      add :cspan_id, :string
      add :votesmart_id, :string
      add :icpsr_id, :string
      add :crp_id, :string
      add :google_entity_id, :string
      add :fec_candidate_id, :string
      add :url, :string
      add :rss_url, :string
      add :contact_form, :string
      add :in_office, :boolean, default: false, null: false
      add :dw_nominate, :float
      add :ideal_point, :integer
      add :seniority, :string
      add :next_election, :string
      add :total_votes, :integer
      add :missed_votes, :integer
      add :total_present, :integer
      add :last_updated, :string
      add :ocd_id, :string
      add :office, :string
      add :phone, :string
      add :fax, :string
      add :state, :string
      add :senate_class, :string
      add :state_rank, :string
      add :lis_id, :string
      add :missed_votes_pct, :float
      add :votes_with_party_pct, :float

      timestamps()
    end
  end
end
