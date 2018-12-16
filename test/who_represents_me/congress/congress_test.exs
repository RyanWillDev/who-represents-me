defmodule WRM.CongressTest do
  use WRM.DataCase

  alias WRM.Congress

  describe "senators" do
    alias WRM.Congress.Senator

    @valid_attrs %{missed_votes_pct: 120.5, suffix: "some suffix", first_name: "some first_name", contact_form: "some contact_form", state: "some state", dw_nominate: 120.5, in_office: true, title: "some title", govtrack_id: "some govtrack_id", votes_with_party_pct: 120.5, seniority: "some seniority", lis_id: "some lis_id", fax: "some fax", probublica_id: "some probublica_id", ocd_id: "some ocd_id", cspan_id: "some cspan_id", youtube_account: "some youtube_account", votesmart_id: "some votesmart_id", gender: "some gender", state_rank: "some state_rank", crp_id: "some crp_id", facebook_account: "some facebook_account", icpsr_id: "some icpsr_id", party: "some party", leadership_role: "some leadership_role", office: "some office", senate_class: "some senate_class", twitter_account: "some twitter_account", google_entity_id: "some google_entity_id", missed_votes: 42, rss_url: "some rss_url", next_election: "some next_election", ideal_point: 42, total_votes: 42, total_present: 42, middle_name: "some middle_name", url: "some url", fec_candidate_id: "some fec_candidate_id", last_name: "some last_name", last_updated: ~D[2010-04-17], date_of_birth: ~D[2010-04-17], api_url: "some api_url", phone: "some phone"}
    @update_attrs %{missed_votes_pct: 456.7, suffix: "some updated suffix", first_name: "some updated first_name", contact_form: "some updated contact_form", state: "some updated state", dw_nominate: 456.7, in_office: false, title: "some updated title", govtrack_id: "some updated govtrack_id", votes_with_party_pct: 456.7, seniority: "some updated seniority", lis_id: "some updated lis_id", fax: "some updated fax", probublica_id: "some updated probublica_id", ocd_id: "some updated ocd_id", cspan_id: "some updated cspan_id", youtube_account: "some updated youtube_account", votesmart_id: "some updated votesmart_id", gender: "some updated gender", state_rank: "some updated state_rank", crp_id: "some updated crp_id", facebook_account: "some updated facebook_account", icpsr_id: "some updated icpsr_id", party: "some updated party", leadership_role: "some updated leadership_role", office: "some updated office", senate_class: "some updated senate_class", twitter_account: "some updated twitter_account", google_entity_id: "some updated google_entity_id", missed_votes: 43, rss_url: "some updated rss_url", next_election: "some updated next_election", ideal_point: 43, total_votes: 43, total_present: 43, middle_name: "some updated middle_name", url: "some updated url", fec_candidate_id: "some updated fec_candidate_id", last_name: "some updated last_name", last_updated: ~D[2011-05-18], date_of_birth: ~D[2011-05-18], api_url: "some updated api_url", phone: "some updated phone"}
    @invalid_attrs %{missed_votes_pct: nil, suffix: nil, first_name: nil, contact_form: nil, state: nil, dw_nominate: nil, in_office: nil, title: nil, govtrack_id: nil, votes_with_party_pct: nil, seniority: nil, lis_id: nil, fax: nil, probublica_id: nil, ocd_id: nil, cspan_id: nil, youtube_account: nil, votesmart_id: nil, gender: nil, state_rank: nil, crp_id: nil, facebook_account: nil, icpsr_id: nil, party: nil, leadership_role: nil, office: nil, senate_class: nil, twitter_account: nil, google_entity_id: nil, missed_votes: nil, rss_url: nil, next_election: nil, ideal_point: nil, total_votes: nil, total_present: nil, middle_name: nil, url: nil, fec_candidate_id: nil, last_name: nil, last_updated: nil, date_of_birth: nil, api_url: nil, phone: nil}

    def senator_fixture(attrs \\ %{}) do
      {:ok, senator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Congress.create_senator()

      senator
    end

    test "list_senators/0 returns all senators" do
      senator = senator_fixture()
      assert Congress.list_senators() == [senator]
    end

    test "get_senator!/1 returns the senator with given id" do
      senator = senator_fixture()
      assert Congress.get_senator!(senator.id) == senator
    end

    test "create_senator/1 with valid data creates a senator" do
      assert {:ok, %Senator{} = senator} = Congress.create_senator(@valid_attrs)
      assert senator.phone == "some phone"
      assert senator.api_url == "some api_url"
      assert senator.date_of_birth == ~D[2010-04-17]
      assert senator.last_updated == ~D[2010-04-17]
      assert senator.last_name == "some last_name"
      assert senator.fec_candidate_id == "some fec_candidate_id"
      assert senator.url == "some url"
      assert senator.middle_name == "some middle_name"
      assert senator.total_present == 42
      assert senator.total_votes == 42
      assert senator.ideal_point == 42
      assert senator.next_election == "some next_election"
      assert senator.rss_url == "some rss_url"
      assert senator.missed_votes == 42
      assert senator.google_entity_id == "some google_entity_id"
      assert senator.twitter_account == "some twitter_account"
      assert senator.senate_class == "some senate_class"
      assert senator.office == "some office"
      assert senator.leadership_role == "some leadership_role"
      assert senator.party == "some party"
      assert senator.icpsr_id == "some icpsr_id"
      assert senator.facebook_account == "some facebook_account"
      assert senator.crp_id == "some crp_id"
      assert senator.state_rank == "some state_rank"
      assert senator.gender == "some gender"
      assert senator.votesmart_id == "some votesmart_id"
      assert senator.youtube_account == "some youtube_account"
      assert senator.cspan_id == "some cspan_id"
      assert senator.ocd_id == "some ocd_id"
      assert senator.probublica_id == "some probublica_id"
      assert senator.fax == "some fax"
      assert senator.lis_id == "some lis_id"
      assert senator.seniority == "some seniority"
      assert senator.votes_with_party_pct == 120.5
      assert senator.govtrack_id == "some govtrack_id"
      assert senator.title == "some title"
      assert senator.in_office == true
      assert senator.dw_nominate == 120.5
      assert senator.state == "some state"
      assert senator.contact_form == "some contact_form"
      assert senator.first_name == "some first_name"
      assert senator.suffix == "some suffix"
      assert senator.missed_votes_pct == 120.5
    end

    test "create_senator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congress.create_senator(@invalid_attrs)
    end

    test "update_senator/2 with valid data updates the senator" do
      senator = senator_fixture()
      assert {:ok, %Senator{} = senator} = Congress.update_senator(senator, @update_attrs)
      assert senator.phone == "some updated phone"
      assert senator.api_url == "some updated api_url"
      assert senator.date_of_birth == ~D[2011-05-18]
      assert senator.last_updated == ~D[2011-05-18]
      assert senator.last_name == "some updated last_name"
      assert senator.fec_candidate_id == "some updated fec_candidate_id"
      assert senator.url == "some updated url"
      assert senator.middle_name == "some updated middle_name"
      assert senator.total_present == 43
      assert senator.total_votes == 43
      assert senator.ideal_point == 43
      assert senator.next_election == "some updated next_election"
      assert senator.rss_url == "some updated rss_url"
      assert senator.missed_votes == 43
      assert senator.google_entity_id == "some updated google_entity_id"
      assert senator.twitter_account == "some updated twitter_account"
      assert senator.senate_class == "some updated senate_class"
      assert senator.office == "some updated office"
      assert senator.leadership_role == "some updated leadership_role"
      assert senator.party == "some updated party"
      assert senator.icpsr_id == "some updated icpsr_id"
      assert senator.facebook_account == "some updated facebook_account"
      assert senator.crp_id == "some updated crp_id"
      assert senator.state_rank == "some updated state_rank"
      assert senator.gender == "some updated gender"
      assert senator.votesmart_id == "some updated votesmart_id"
      assert senator.youtube_account == "some updated youtube_account"
      assert senator.cspan_id == "some updated cspan_id"
      assert senator.ocd_id == "some updated ocd_id"
      assert senator.probublica_id == "some updated probublica_id"
      assert senator.fax == "some updated fax"
      assert senator.lis_id == "some updated lis_id"
      assert senator.seniority == "some updated seniority"
      assert senator.votes_with_party_pct == 456.7
      assert senator.govtrack_id == "some updated govtrack_id"
      assert senator.title == "some updated title"
      assert senator.in_office == false
      assert senator.dw_nominate == 456.7
      assert senator.state == "some updated state"
      assert senator.contact_form == "some updated contact_form"
      assert senator.first_name == "some updated first_name"
      assert senator.suffix == "some updated suffix"
      assert senator.missed_votes_pct == 456.7
    end

    test "update_senator/2 with invalid data returns error changeset" do
      senator = senator_fixture()
      assert {:error, %Ecto.Changeset{}} = Congress.update_senator(senator, @invalid_attrs)
      assert senator == Congress.get_senator!(senator.id)
    end

    test "delete_senator/1 deletes the senator" do
      senator = senator_fixture()
      assert {:ok, %Senator{}} = Congress.delete_senator(senator)
      assert_raise Ecto.NoResultsError, fn -> Congress.get_senator!(senator.id) end
    end

    test "change_senator/1 returns a senator changeset" do
      senator = senator_fixture()
      assert %Ecto.Changeset{} = Congress.change_senator(senator)
    end
  end

  describe "house_members" do
    alias WRM.Congress.HouseMember

    @valid_attrs %{leadership_role: "some leadership_role", google_entity_id: "some google_entity_id", at_large: true, state: "some state", missed_votes_pct: 120.5, dw_nominate: 120.5, middle_name: "some middle_name", suffix: "some suffix", total_present: 42, title: "some title", party: "some party", gender: "some gender", rss_url: "some rss_url", first_name: "some first_name", votesmart_id: "some votesmart_id", crp_id: "some crp_id", propublica_id: "some propublica_id", youtube_account: "some youtube_account", geoid: "some geoid", in_office: true, ideal_point: 42, district: "some district", icpsr_id: "some icpsr_id", fax: "some fax", ocd_id: "some ocd_id", votes_with_party_pct: 120.5, last_updated: "some last_updated", last_name: "some last_name", contact_form: "some contact_form", total_votes: 42, senority: "some senority", short_title: "some short_title", next_election: "some next_election", govtrack_id: "some govtrack_id", twitter_account: "some twitter_account", fec_candidate_id: "some fec_candidate_id", facebook_account: "some facebook_account", url: "some url", api_uri: "some api_uri", phone: "some phone", office: "some office", date_of_birth: ~D[2010-04-17], cspan_id: "some cspan_id"}
    @update_attrs %{leadership_role: "some updated leadership_role", google_entity_id: "some updated google_entity_id", at_large: false, state: "some updated state", missed_votes_pct: 456.7, dw_nominate: 456.7, middle_name: "some updated middle_name", suffix: "some updated suffix", total_present: 43, title: "some updated title", party: "some updated party", gender: "some updated gender", rss_url: "some updated rss_url", first_name: "some updated first_name", votesmart_id: "some updated votesmart_id", crp_id: "some updated crp_id", propublica_id: "some updated propublica_id", youtube_account: "some updated youtube_account", geoid: "some updated geoid", in_office: false, ideal_point: 43, district: "some updated district", icpsr_id: "some updated icpsr_id", fax: "some updated fax", ocd_id: "some updated ocd_id", votes_with_party_pct: 456.7, last_updated: "some updated last_updated", last_name: "some updated last_name", contact_form: "some updated contact_form", total_votes: 43, senority: "some updated senority", short_title: "some updated short_title", next_election: "some updated next_election", govtrack_id: "some updated govtrack_id", twitter_account: "some updated twitter_account", fec_candidate_id: "some updated fec_candidate_id", facebook_account: "some updated facebook_account", url: "some updated url", api_uri: "some updated api_uri", phone: "some updated phone", office: "some updated office", date_of_birth: ~D[2011-05-18], cspan_id: "some updated cspan_id"}
    @invalid_attrs %{leadership_role: nil, google_entity_id: nil, at_large: nil, state: nil, missed_votes_pct: nil, dw_nominate: nil, middle_name: nil, suffix: nil, total_present: nil, title: nil, party: nil, gender: nil, rss_url: nil, first_name: nil, votesmart_id: nil, crp_id: nil, propublica_id: nil, youtube_account: nil, geoid: nil, in_office: nil, ideal_point: nil, district: nil, icpsr_id: nil, fax: nil, ocd_id: nil, votes_with_party_pct: nil, last_updated: nil, last_name: nil, contact_form: nil, total_votes: nil, senority: nil, short_title: nil, next_election: nil, govtrack_id: nil, twitter_account: nil, fec_candidate_id: nil, facebook_account: nil, url: nil, api_uri: nil, phone: nil, office: nil, date_of_birth: nil, cspan_id: nil}

    def house_member_fixture(attrs \\ %{}) do
      {:ok, house_member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Congress.create_house_member()

      house_member
    end

    test "list_house_members/0 returns all house_members" do
      house_member = house_member_fixture()
      assert Congress.list_house_members() == [house_member]
    end

    test "get_house_member!/1 returns the house_member with given id" do
      house_member = house_member_fixture()
      assert Congress.get_house_member!(house_member.id) == house_member
    end

    test "create_house_member/1 with valid data creates a house_member" do
      assert {:ok, %HouseMember{} = house_member} = Congress.create_house_member(@valid_attrs)
      assert house_member.cspan_id == "some cspan_id"
      assert house_member.date_of_birth == ~D[2010-04-17]
      assert house_member.office == "some office"
      assert house_member.phone == "some phone"
      assert house_member.api_uri == "some api_uri"
      assert house_member.url == "some url"
      assert house_member.facebook_account == "some facebook_account"
      assert house_member.fec_candidate_id == "some fec_candidate_id"
      assert house_member.twitter_account == "some twitter_account"
      assert house_member.govtrack_id == "some govtrack_id"
      assert house_member.next_election == "some next_election"
      assert house_member.short_title == "some short_title"
      assert house_member.senority == "some senority"
      assert house_member.total_votes == 42
      assert house_member.contact_form == "some contact_form"
      assert house_member.last_name == "some last_name"
      assert house_member.last_updated == "some last_updated"
      assert house_member.votes_with_party_pct == 120.5
      assert house_member.ocd_id == "some ocd_id"
      assert house_member.fax == "some fax"
      assert house_member.icpsr_id == "some icpsr_id"
      assert house_member.district == "some district"
      assert house_member.ideal_point == 42
      assert house_member.in_office == true
      assert house_member.geoid == "some geoid"
      assert house_member.youtube_account == "some youtube_account"
      assert house_member.propublica_id == "some propublica_id"
      assert house_member.crp_id == "some crp_id"
      assert house_member.votesmart_id == "some votesmart_id"
      assert house_member.first_name == "some first_name"
      assert house_member.rss_url == "some rss_url"
      assert house_member.gender == "some gender"
      assert house_member.party == "some party"
      assert house_member.title == "some title"
      assert house_member.total_present == 42
      assert house_member.suffix == "some suffix"
      assert house_member.middle_name == "some middle_name"
      assert house_member.dw_nominate == 120.5
      assert house_member.missed_votes_pct == 120.5
      assert house_member.state == "some state"
      assert house_member.at_large == true
      assert house_member.google_entity_id == "some google_entity_id"
      assert house_member.leadership_role == "some leadership_role"
    end

    test "create_house_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Congress.create_house_member(@invalid_attrs)
    end

    test "update_house_member/2 with valid data updates the house_member" do
      house_member = house_member_fixture()
      assert {:ok, %HouseMember{} = house_member} = Congress.update_house_member(house_member, @update_attrs)
      assert house_member.cspan_id == "some updated cspan_id"
      assert house_member.date_of_birth == ~D[2011-05-18]
      assert house_member.office == "some updated office"
      assert house_member.phone == "some updated phone"
      assert house_member.api_uri == "some updated api_uri"
      assert house_member.url == "some updated url"
      assert house_member.facebook_account == "some updated facebook_account"
      assert house_member.fec_candidate_id == "some updated fec_candidate_id"
      assert house_member.twitter_account == "some updated twitter_account"
      assert house_member.govtrack_id == "some updated govtrack_id"
      assert house_member.next_election == "some updated next_election"
      assert house_member.short_title == "some updated short_title"
      assert house_member.senority == "some updated senority"
      assert house_member.total_votes == 43
      assert house_member.contact_form == "some updated contact_form"
      assert house_member.last_name == "some updated last_name"
      assert house_member.last_updated == "some updated last_updated"
      assert house_member.votes_with_party_pct == 456.7
      assert house_member.ocd_id == "some updated ocd_id"
      assert house_member.fax == "some updated fax"
      assert house_member.icpsr_id == "some updated icpsr_id"
      assert house_member.district == "some updated district"
      assert house_member.ideal_point == 43
      assert house_member.in_office == false
      assert house_member.geoid == "some updated geoid"
      assert house_member.youtube_account == "some updated youtube_account"
      assert house_member.propublica_id == "some updated propublica_id"
      assert house_member.crp_id == "some updated crp_id"
      assert house_member.votesmart_id == "some updated votesmart_id"
      assert house_member.first_name == "some updated first_name"
      assert house_member.rss_url == "some updated rss_url"
      assert house_member.gender == "some updated gender"
      assert house_member.party == "some updated party"
      assert house_member.title == "some updated title"
      assert house_member.total_present == 43
      assert house_member.suffix == "some updated suffix"
      assert house_member.middle_name == "some updated middle_name"
      assert house_member.dw_nominate == 456.7
      assert house_member.missed_votes_pct == 456.7
      assert house_member.state == "some updated state"
      assert house_member.at_large == false
      assert house_member.google_entity_id == "some updated google_entity_id"
      assert house_member.leadership_role == "some updated leadership_role"
    end

    test "update_house_member/2 with invalid data returns error changeset" do
      house_member = house_member_fixture()
      assert {:error, %Ecto.Changeset{}} = Congress.update_house_member(house_member, @invalid_attrs)
      assert house_member == Congress.get_house_member!(house_member.id)
    end

    test "delete_house_member/1 deletes the house_member" do
      house_member = house_member_fixture()
      assert {:ok, %HouseMember{}} = Congress.delete_house_member(house_member)
      assert_raise Ecto.NoResultsError, fn -> Congress.get_house_member!(house_member.id) end
    end

    test "change_house_member/1 returns a house_member changeset" do
      house_member = house_member_fixture()
      assert %Ecto.Changeset{} = Congress.change_house_member(house_member)
    end
  end
end
