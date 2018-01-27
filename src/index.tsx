import { h, render } from 'preact';

declare const require: any;

let root: Element;

function renderApp() {
  let App = require('./app').default;
  root = render(<App />, document.getElementById('app'), root);
}

renderApp();

// Enable HMR
declare const module: any;
if (module.hot) {
  module.hot.accept('./app', renderApp);
}
