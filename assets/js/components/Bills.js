import { Democrat, Republican } from './PartyIcons';
import { format } from 'date-fns';
import { html } from '@polymer/lit-element';

export default bills => html`
  <h2 class="mb-4 capitalize">Bills Sponsored</h2>
  <ul class="text-black">
    ${
      bills.map(
        b => html`
          <li class="mb-4 bg-white py-8 px-4 rounded flex flex-wrap">
            <div class="w-full mb-6">
              <div>
                <h3 class="mb-2">${b.short_title}</h3>
                <div class="text-sm mb-2">
                  <span class="mb-2 inline-block">${b.number}</span>
                  <span class="mb-2 inline-block"
                    >${format(b.introduced_date, 'MMMM d, y')}</span
                  >
                </div>
                <p class="text-sm">${b.title}</p>
              </div>
            </div>
            ${
              html`
                <div class="flex flex-wrap justify-between w-full">
                  <div class="mb-4 w-full md:w-1/2">
                    <h4 class="mb-2 capitalize">Cosponsors by party</h4>
                    <div class="flex w-full">
                      <div class="mr-4">
                        ${Republican()}
                        <span
                          class="align-middle h-full inline-block text-2xl ml-1"
                          >${
                            cosponsorsByParty(b.cosponsors_by_party, 'R')
                          }</span
                        >
                      </div>
                      <div>
                        ${Democrat()}
                        <span
                          class="align-middle h-full inline-block text-2xl ml-1"
                          >${
                            cosponsorsByParty(b.cosponsors_by_party, 'D')
                          }</span
                        >
                      </div>
                    </div>
                  </div>
                  <div class="mb-4 w-full md:w-1/2">
                    <h4 class="capitalize mb-2">status</h4>
                    ${billStatus(b)}
                  </div>
                  <div class="mb-4 w-full md:w-1/2">
                    <h4 class="capitalize mb-2">Passage</h4>
                    <div class="text-sm">
                      <span class="capitalize block"
                        >Passed House: ${b.house_passage || 'No'}</span
                      >
                      <span class="capitalize block"
                        >Passed Senate: ${b.senate_passage || 'No'}</span
                      >
                    </div>
                  </div>
                  <div class="mb-4 w-full md:w-1/2">
                    <h4 class="mb-2">Latest Action</h4>
                    <p class="text-sm">
                      ${format(b.latest_major_action_date, 'MMMM d, y')}
                    </p>
                    <p class="text-sm">${b.latest_major_action}</p>
                  </div>
                </div>
              `
            }
          </li>
        `
      )
    }
  </ul>
`;

function cosponsorsByParty(cosponsors, party) {
  return cosponsors[party] || 0;
}

function billStatus(bill) {
  return bill.active
    ? html`
        <span class="text-green capitalize text-2xl">Active</span>
      `
    : html`
        <span class="text-red capitalize text-2xl">Inactive</span>
      `;
}
