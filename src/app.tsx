import { h } from 'preact';

import './style.scss';
import { Header } from './components';
import { ZipCodeInput } from './components/zip-code-input/zipCodeInput';

const App = () => (
  <div style={{ width: '100vw', height: '100vh' }}>
    <Header />
    <main style={{ padding: '0 2%' }}>
      <ZipCodeInput />
    </main>
  </div>
);

export default App;
