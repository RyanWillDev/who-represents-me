defmodule WRM.Congress do
  @moduledoc """
  The Congress context.
  """

  import Ecto.Query, warn: false
  alias WRM.Repo

  alias WRM.Congress.Member

  def get_member(%{"chamber" => chamber, "name" => name, "ocd_id" => ocd_id}) do
    {first_name, last_name} =
      String.split(name, " ", trim: true)
      |> (fn
            [f, _, l] ->
              {f, l}

            [f, l] ->
              {f, l}
          end).()

    query =
      from(m in Member)
      |> where(
        [m],
        m.first_name == ^first_name and m.last_name == ^last_name and m.ocd_id == ^ocd_id and
          m.chamber == ^chamber
      )

    try do
      query |> Repo.one()
    rescue
      _ in Ecto.MultipleResultsError ->
        query |> Repo.all() |> Enum.reduce(&Map.merge/2)
    end
  end

  @doc """
  Returns the list of members.

  ## Examples

      iex> list_members()
      [%Member{}, ...]

  """
  def list_members do
    Repo.all(Member)
  end

  @doc """
  Gets a single member.

  Raises `Ecto.NoResultsError` if the member does not exist.

  ## Examples

      iex> get_member!(123)
      %Member{}

      iex> get_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_member!(id), do: Repo.get!(Member, id)

  @doc """
  Creates a member.

  ## Examples

      iex> create_member(%{field: value})
      {:ok, %Member{}}

      iex> create_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_member(attrs \\ %{}) do
    %Member{}
    |> Member.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a member.

  ## Examples

      iex> update_member(member, %{field: new_value})
      {:ok, %Member{}}

      iex> update_member(member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_member(%Member{} = member, attrs) do
    member
    |> Member.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Member.

  ## Examples

      iex> delete_member(member)
      {:ok, %Member{}}

      iex> delete_member(member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_member(%Member{} = member) do
    Repo.delete(member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking member changes.

  ## Examples

      iex> change_member(member)
      %Ecto.Changeset{source: %Member{}}

  """
  def change_member(%Member{} = member) do
    Member.changeset(member, %{})
  end
end
