import { h, render } from 'preact';

import App from './app';

render(<App />, document.getElementById('app'));

// Enable HMR
declare const module: any;
if (module.hot) {
  module.hot.accept('./app');
}
