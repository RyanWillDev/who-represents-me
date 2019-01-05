import { html } from '@polymer/lit-element';
import { format } from 'date-fns';

export default votes =>
  html`
    <div>
      <h2 class="capitalize mb-5">Stats for current term</h2>
      <div
        class="flex flex-wrap text-xl justify-center md:justify-between mb-8"
      >
        <div class="mb-4 w-full sm:w-1/2">
          <span class="capitalize">Total Votes:</span>
          <span>${votes.total_votes || 0}</span>
        </div>

        <div class="mb-4 sm:text-right w-full sm:w-1/2">
          <span class="capitalize">Votes with party:</span>
          <span>${votes.votes_with_party_pct || 0}%</span>
        </div>

        <div class="mb-4 w-full sm:w-1/2">
          <span class="capitalize">Missed Votes:</span>
          <span class="text-red">${votes.missed_votes_pct || 0}%</span>
        </div>

        <div class="mb-4 sm:text-right w-full sm:w-1/2">
          <span class="capitalize">Total Missed Votes:</span>
          <span class="text-red">${numberOfMissedVotes(votes) || 0}</span>
        </div>
      </div>

      <section>
        <h2 class="mb-4">Recent Votes</h2>
        <ul class="text-black">
          ${
            votes.positions.map(
              p => html`
                <li class="mb-4 bg-white py-8 px-4 rounded flex flex-wrap">
                  <div>
                    <div class="text-base mb-4">
                      <h3>
                        <span class="block mb-1">${p.bill.number}</span>
                        <span class="text-sm"
                          >${format(p.date, 'MMMM d, y')}</span
                        >
                      </h3>
                    </div>
                    <p class="text-sm block mb-4">${p.description}</p>
                    <div class="flex flex-wrap">
                      <p class="text-sm block w-full mb-2">
                        Question: ${p.question}
                      </p>
                      <p class="text-sm block w-full mb-2">
                        Position Taken:
                        <span class="${calloutColor(p.position)}">
                          ${p.position}</span
                        >
                      </p>
                      <p class="text-sm block w-full">
                        Result: <span>${p.result}</span>
                      </p>
                    </div>
                  </div>
                </li>
              `
            )
          }
        </ul>
      </section>
    </div>
  `;

function numberOfMissedVotes(votes) {
  return (
    votes.missed_votes || votes.total_votes * (votes.missed_votes_pct / 100)
  );
}

function calloutColor(text) {
  if (['yes'].includes(text.toLowerCase())) return 'text-green';
  else if (['no', 'not voting'].includes(text.toLowerCase())) return 'text-red';
}
