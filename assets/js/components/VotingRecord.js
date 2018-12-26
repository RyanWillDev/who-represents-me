import { html, LitElement } from '@polymer/lit-element';

export default member =>
  html`
    <div class="flex flex-wrap text-xl justify-between">
      <div class="mb-4 w-full sm:w-1/2">
        <span class="capitalize">Total Votes:</span>
        <span><%= @member.total_votes %></span>
      </div>

      <div class="mb-4 sm:text-right w-full sm:w-1/2">
        <span class="capitalize">Votes with party:</span>
        <span><%= @member.votes_with_party_pct %>%</span>
      </div>

      <div class="mb-4 w-full sm:w-1/2">
        <span class="capitalize">Missed Votes:</span>
        <span class="text-red"><%= @member.missed_votes_pct %>%</span>
      </div>

      <div class="mb-4 sm:text-right w-full sm:w-1/2">
        <span class="capitalize">Total Missed Votes:</span> <%= if
        Map.has_key?(@member, :missed_votes) do %>
        <span class="text-red"><%= @member.missed_votes %></span> <% else %>
        <span class="text-red"><%= number_of_missed_votes(@member) %></span> <%
        end %>
      </div>
    </div>
  `;
