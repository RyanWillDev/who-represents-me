import { html, LitElement } from '@polymer/lit-element';

class VotingRecord extends LitElement {
  constructor() {
    super();
  }

  render() {
    return html`
      <div><h1>Test</h1></div>
    `;
  }
}

export default {
  tag: 'voting-record',
  element: VotingRecord,
};
