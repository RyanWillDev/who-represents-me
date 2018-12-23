defmodule WRM.Congress do
  @moduledoc """
  The Congress context.
  """

  import Ecto.Query, warn: false
  alias WRM.Repo

  alias WRM.Congress.{HouseMember, Senator}

  def get_member(%{"chamber" => chamber, "name" => name, "ocd_id" => ocd_id}) do
    {first_name, last_name} =
      String.split(name, " ", trim: true)
      |> (fn
            [f, _, l] ->
              {f, l}

            [f, l] ->
              {f, l}
          end).()

    case chamber do
      "house" ->
        from(m in HouseMember)

      "senate" ->
        from(m in Senator)
    end
    |> where(
      [m],
      m.first_name == ^first_name and m.last_name == ^last_name and m.ocd_id == ^ocd_id
    )
    |> Repo.one()
  end

  @doc """
  Returns the list of senators.

  ## Examples

      iex> list_senators()
      [%Senator{}, ...]

  """
  def list_senators do
    Repo.all(Senator)
  end

  @doc """
  Gets a single senator.

  Raises `Ecto.NoResultsError` if the Senator does not exist.

  ## Examples

      iex> get_senator!(123)
      %Senator{}

      iex> get_senator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_senator!(id), do: Repo.get!(Senator, id)

  @doc """
  Creates a senator.

  ## Examples

      iex> create_senator(%{field: value})
      {:ok, %Senator{}}

      iex> create_senator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_senator(attrs \\ %{}) do
    %Senator{}
    |> Senator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a senator.

  ## Examples

      iex> update_senator(senator, %{field: new_value})
      {:ok, %Senator{}}

      iex> update_senator(senator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_senator(%Senator{} = senator, attrs) do
    senator
    |> Senator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Senator.

  ## Examples

      iex> delete_senator(senator)
      {:ok, %Senator{}}

      iex> delete_senator(senator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_senator(%Senator{} = senator) do
    Repo.delete(senator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking senator changes.

  ## Examples

      iex> change_senator(senator)
      %Ecto.Changeset{source: %Senator{}}

  """
  def change_senator(%Senator{} = senator) do
    Senator.changeset(senator, %{})
  end

  @doc """
  Returns the list of house_members.

  ## Examples

      iex> list_house_members()
      [%HouseMember{}, ...]

  """
  def list_house_members do
    Repo.all(HouseMember)
  end

  @doc """
  Gets a single house_member.

  Raises `Ecto.NoResultsError` if the House member does not exist.

  ## Examples

      iex> get_house_member!(123)
      %HouseMember{}

      iex> get_house_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_house_member!(id), do: Repo.get!(HouseMember, id)

  @doc """
  Creates a house_member.

  ## Examples

      iex> create_house_member(%{field: value})
      {:ok, %HouseMember{}}

      iex> create_house_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_house_member(attrs \\ %{}) do
    %HouseMember{}
    |> HouseMember.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a house_member.

  ## Examples

      iex> update_house_member(house_member, %{field: new_value})
      {:ok, %HouseMember{}}

      iex> update_house_member(house_member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_house_member(%HouseMember{} = house_member, attrs) do
    house_member
    |> HouseMember.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HouseMember.

  ## Examples

      iex> delete_house_member(house_member)
      {:ok, %HouseMember{}}

      iex> delete_house_member(house_member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_house_member(%HouseMember{} = house_member) do
    Repo.delete(house_member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking house_member changes.

  ## Examples

      iex> change_house_member(house_member)
      %Ecto.Changeset{source: %HouseMember{}}

  """
  def change_house_member(%HouseMember{} = house_member) do
    HouseMember.changeset(house_member, %{})
  end
end
