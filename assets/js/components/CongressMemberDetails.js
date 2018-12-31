import * as SocialIcons from './SocialIcons';
import Bills from './Bills';
import VotingRecord from './VotingRecord';
import http from '../http';
import { Democrat, Republican } from './PartyIcons';
import { html, LitElement } from '@polymer/lit-element';
import CongressMemberPlaceholder from './CongressMemberPlaceholder';

class CongressMemberDetails extends LitElement {
  constructor() {
    super();

    this.currentTab = 'votes';
    this.data = null;
  }

  createRenderRoot() {
    return this;
  }

  static get properties() {
    return {
      chamber: String,
      propublicaId: String,
      term: Number,
      currentTab: String,
      data: Object,
    };
  }

  changeTab(tab) {
    this.currentTab = tab;
  }

  displayName(member) {
    return member.first_name
      .concat(' ')
      .concat(member.middle_name ? member.middle_name : '')
      .concat(member.last_name);
  }

  socialLinks(member) {
    return [
      {
        id: member.twitter_account,
        type: 'Twitter',
        link: `https://twitter.com/${member.twitter_account}`,
      },
      {
        id: member.facebook_account,
        type: 'Facebook',
        link: `https://twitter.com/${member.facebook_account}`,
      },
      {
        id: member.youtube_account,
        type: 'YouTube',
        link: `https://twitter.com/${member.youtube_account}`,
      },
    ]
      .filter(socialData => socialData.id != null)
      .map(
        socialData => html`
          <li class="mr-2">
            <a class="py-2" href=${socialData.link}
              >${SocialIcons[socialData.type]()}</a
            >
          </li>
        `
      );
  }

  partyIcon(member) {
    return {
      R: Republican(),
      D: Democrat(),
    }[member.party];
  }

  tabContents(member) {
    return {
      votes: VotingRecord(member.votes),
      bills: Bills(member.bills),
      finances: html`
        <h1>Working on it</h1>
      `,
    }[this.currentTab];
  }

  template(member) {
    return html`
      <div class="flex flex-wrap justify-center mb-12 sm:justify-start">
        <img class="w-32 h-full mb-4 inline-block rounded md:mb-0"
        src=https://theunitedstates.io/images/congress/225x275/${
          this.propublicaId
        }.jpg
        alt="Photo of ${this.displayName(member)}" />
        <div class="ml-4 flex-col text-center sm:text-left">
          <div class="">
            <h1 class="mb-2">${this.displayName(member)}</h1>
            <h2 class="text-sm mb-4">
              ${member.leadership_role || member.title}
            </h2>
          </div>
          <div class="mb-2">
            <ul class="flex flex-wrap justify-center sm:justify-start">
              ${this.socialLinks(member)}
            </ul>
          </div>
          <div
            class="flex justify-center sm:self-end sm:items-end sm:justify-start"
          >
            ${this.partyIcon(member)}
          </div>
        </div>
      </div>
      <div>
        <ul class="flex mb-12 justify-center sm:justify-start">
          ${
            ['votes', 'bills' /* 'finances' */].map(
              (tab, i) =>
                html`
                  <li
                    class="capitalize cursor-pointer ${
                      styleActiveTab(this.currentTab, tab)
                        .concat(' ')
                        .concat(i !== 1 ? 'mr-4' : '')
                    } border-b-2 border-transparent text-2xl pb-2 mr-4"
                    @click=${this.changeTab.bind(this, tab)}
                  >
                    ${tab}
                  </li>
                `
            )
          }
        </ul>
        <section>${this.tabContents(member)}</section>
      </div>
    `;
  }

  connectedCallback() {
    http
      .get(
        `congress_members/details?chamber=${this.chamber}&propublica_id=${
          this.propublicaId
        }&term=${this.term}`
      )
      .then(res => res)
      .then(res => (this.data = res.data));
  }

  render() {
    return html`
      <section
        class="w-3/4 max-w-xl h-full mx-auto mb-32bg-black ${
          this.data && 'pt-24'
        }"
      >
        ${
          this.data
            ? this.template(this.data)
            : html`
                <div class="h-screen flex justify-center items-center">
                  <loading-pulse></loading-pulse>
                </div>
              `
        }
      </section>
    `;
  }
}

function styleActiveTab(activeTab, tab) {
  return activeTab === tab ? 'border-b-2 border-white' : 'opacity-75';
}

export default {
  tag: 'congress-member-details',
  element: CongressMemberDetails,
};
