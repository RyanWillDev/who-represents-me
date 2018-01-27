import { h, Component } from 'preact';
import TextField from 'preact-material-components/TextField';
import 'preact-material-components/TextField/style.css';

import './zip-code-input.scss';
import { EventHandler, InputChangeEvent } from '../../types';

interface State {
  zipCode: string;
}

export class ZipCodeInput extends Component<{}, State> {
  constructor() {
    super();
    this.state = {
      zipCode: ''
    };
  }

  updateZip: EventHandler<InputChangeEvent> = ({ currentTarget: { value } }) =>
    this.setState({ zipCode: value });

  render() {
    const errorClasses = this.state.zipCode.length
      ? 'error-indicator'
      : 'error-indicator hidden';

    return (
      <div>
        <h2>Enter Zip Code to see representatives</h2>
        <input
          type="text"
          value={this.state.zipCode}
          onChange={this.updateZip}
          placeholder="Five digit Zip Code"
          pattern="[0-9]{5}"
          minLength={5}
          maxLength={5}
          required
        />
        <button>Submit</button>
        <span class={errorClasses}>
          Something looks wrong with the Zip Code you entered! Please enter a 5
          digit Zip Code.
        </span>
      </div>
    );
  }
}
