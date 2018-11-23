defmodule CivicApi.Formatter do
  def representative_response(body) do
    # Create lookup of office data by official index
    offices_by_official_index =
      body["offices"]
      |> Enum.reduce(%{}, fn office, acc ->
        offices_by_offical_index(office)
        |> Map.merge(acc)
      end)

    body["officials"]
    |> Enum.with_index()
    # Add office data from lookup to the official with corresponding index
    |> Enum.map(fn {official, index} ->
      official
      |> Map.merge(%{"office" => offices_by_official_index[to_string(index)]})
    end)
    |> Enum.map(&format_rep_list_data(&1, ["phones", "emails", "urls"]))
  end

  defp offices_by_offical_index(office) do
    Enum.reduce(office["officialIndices"], %{}, fn official_index, index_acc ->
      office_without_offical_indices = Map.drop(office, ["officialIndices"])
      Map.put(index_acc, to_string(official_index), office_without_offical_indices)
    end)
  end

  defp format_rep_list_data(rep, []) do
    rep
  end

  defp format_rep_list_data(rep, [current | rest]) do
    list_data =
      Map.get(rep, current, [])
      |> Enum.uniq()

    Map.merge(rep, %{current => list_data})
    |> format_rep_list_data(rest)
  end
end
