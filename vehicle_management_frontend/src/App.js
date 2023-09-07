import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {
  const [vehicles, setVehicles] = useState([]);

  const API_URL = 'http://localhost:3000/api/vehicles';

  const getVehicles = async () => {
    const response = await fetch(API_URL);
    const data = await response.json();
    console.log(data);
  }

  useEffect(() => {
    getVehicles();
  }, []);


  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
