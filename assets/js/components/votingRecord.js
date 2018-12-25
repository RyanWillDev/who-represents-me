import { html, LitElement } from '@polymer/lit-element';
import { until } from 'lit-html/directives/until';
import http from '../http';

class VotingRecord extends LitElement {
  constructor() {
    super();
  }

  static get properties() {
    return {
      propublicaId: String,
    };
  }

  getTabContent(data) {
    return html`
      <h1>${data.first_name}</h1>
    `;
  }

  connectedCallback() {
    this.tabContent = http
      .get(`congress_members/${this.propublicaId}/details`)
      .then(res => res.data)
      .then(this.getTabContent);
  }

  render() {
    return html`
      <div>${until(this.tabContent, `Loading`)}</div>
    `;
  }
}

export default {
  tag: 'voting-record',
  element: VotingRecord,
};
