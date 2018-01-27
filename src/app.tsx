import { h } from 'preact';

import './style.scss';
import { Header } from './components';

const App = () => (
  <div style={{ width: '100vw', height: '100vh' }}>
    <Header />
  </div>
);

export default App;
