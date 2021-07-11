import './App.css';
import SidebarComponent from "./components/SidebarComponent"
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import Home from "./components/Home/Home.js"


function App() {
  return (
    <Router>
      <div className="App">
          <SidebarComponent />
          <Switch>
            <Route path="/">
              <Home></Home>
            </Route>
          </Switch>
      </div>
    </Router>
  );
}

export default App;
