import { html, LitElement } from '@polymer/lit-element';
import { until } from 'lit-html/directives/until';
import http from '../http';
import VotingRecord from './VotingRecord';
import * as SocialIcons from './SocialIcons';
import { Democrat, Republican } from './PartyIcons';
import css from '../../css/app.css';

class CongressMemberDetails extends LitElement {
  constructor() {
    console.log(css);
    super();
    this.placeholder = 'Loading';
  }

  createRenderRoot() {
    return this;
  }

  static get properties() {
    return {
      propublicaId: String,
    };
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
      R: Republican,
      D: Democrat,
    }[member.current_party]();
  }

  tabContents(member) {
    return html`
      ${VotingRecord()}
    `;
  }

  template(member) {
    return html`
      <section class="w-3/4 mx-auto pt-24 bg-black">
        <div class="flex flex-wrap justify-center mb-12 sm:justify-start">
          <img class="w-32 mb-4 inline-block rounded md:mb-0"
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
          <ul class="flex w-full mb-12 justify-between">
            ${
              ['votes', 'blah', 'blah'].map(
                tab =>
                  html`
                    <li class="border-b-2 border-white pb-2">${tab}</li>
                  `
              )
            }
          </ul>
        </div>
      </section>
    `;
    // <!-- <section>${this.tabContents(member)}</section> -->
  }

  connectedCallback() {
    this.content = http
      .get(`congress_members/${this.propublicaId}/details`)
      .then(res => console.log(res.data) || res.data)
      .then(this.template.bind(this));
  }

  render() {
    return html`
      ${until(this.content, 'Loading!!!')}
    `;
  }
}

export default {
  tag: 'congress-member-details',
  element: CongressMemberDetails,
};
