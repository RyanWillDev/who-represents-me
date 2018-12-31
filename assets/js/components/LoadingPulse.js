import { html, LitElement } from '@polymer/lit-element';

class LoadingPulse extends LitElement {
  constructor() {
    super();
  }

  render() {
    return html`
      <style>
        @keyframes pulse {
          50% {
            background: rgb(255, 255, 255);
          }
        }
        .loading-pulse {
          position: relative;
          width: calc(56px / 4);
          height: 56px;
          background: rgba(255, 255, 255, 0.2);
          animation: pulse 750ms infinite;
          animation-delay: calc(750ms / 3);
        }
        .loading-pulse:before,
        .loading-pulse:after {
          content: '';
          position: absolute;
          display: block;
          height: calc(56px / 1.5);
          width: calc(56px / 4);
          background: rgba(255, 255, 255, 0.2);
          top: 50%;
          transform: translateY(-50%);
          animation: pulse 750ms infinite;
        }
        .loading-pulse:before {
          left: calc(-56px / 2);
        }
        .loading-pulse:after {
          left: calc(56px / 2);
          animation-delay: calc(750ms / 1.5);
        }
      </style>

      <div class="loading-pulse"></div>
    `;
  }
}

export default {
  tag: 'loading-pulse',
  element: LoadingPulse,
};
