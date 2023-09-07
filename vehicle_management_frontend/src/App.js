import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

function App() {
  const [vehicles, setVehicles] = useState([]);

  const API_URL = 'http://localhost:3000/api/v1/vehicles';

  const getVehicles = async () => {
    const response = await fetch(API_URL);
    const data = await response.json();
    setVehicles(data);
    console.log(data);
  }

  useEffect(() => {
    getVehicles();
  }, []);


  return (
    <div className="App">
      <h1>Vehicle Management</h1>
      {
        vehicles.map((vehicle) => (
          <div key={vehicle.id}>
            <h2>Name: {vehicle.name}</h2>
            <p>Stage: {vehicle.current_state}</p>
          </div>
        ))
      }
    </div>
  );
}


export default App;
