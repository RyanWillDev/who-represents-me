import { html, LitElement } from '@polymer/lit-element';

export default votes =>
  html`
    <div class="flex flex-wrap text-xl justify-between">
      <div class="mb-4 w-full sm:w-1/2">
        <span class="capitalize">Total Votes:</span>
        <span>${votes.total_votes}</span>
      </div>

      <div class="mb-4 sm:text-right w-full sm:w-1/2">
        <span class="capitalize">Votes with party:</span>
        <span>${votes.votes_with_party_pct}%</span>
      </div>

      <div class="mb-4 w-full sm:w-1/2">
        <span class="capitalize">Missed Votes:</span>
        <span class="text-red">${votes.missed_votes_pct}%</span>
      </div>

      <div class="mb-4 sm:text-right w-full sm:w-1/2">
        <span class="capitalize">Total Missed Votes:</span>
        <span class="text-red">${number_of_missed_votes(votes)}</span>
      </div>
    </div>
  `;

function number_of_missed_votes(votes) {
  return (
    votes.missed_votes || votes.total_votes * (votes.missed_votes_pct / 100)
  );
}
