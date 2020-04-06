import React from "react";

import "./App.css";

import { CardList } from "./components/card-list/card-list.component";
import { SearchField } from "./components/search-field/search-field.component";

import { getUsers } from "./constants/apiUrl";

class App extends React.Component {
  constructor() {
    super();

    this.state = {
      monsters: [],
      searchfield: "",
    };
  }

  async componentDidMount() {
    try {
      const response = await fetch(`${getUsers}/api/users`);
      console.log(response);
      const users = await response.json();
      console.log(users);
      this.setState({ monsters: users });
    } catch (err) {
      console.error(err.message);
    }
  }

  handleOnSearchChange = (e) => {
    this.setState({ searchfield: e.target.value });
  };

  render() {
    const { monsters, searchfield } = this.state;
    const filteredMonsters = monsters.filter((monster) =>
      monster.name.toLowerCase().includes(searchfield.toLowerCase())
    );

    return (
      <div className="App">
        <h1>Monsters Rodolex</h1>
        <SearchField handleOnSearchChange={this.handleOnSearchChange} />
        <CardList monsters={filteredMonsters} />
      </div>
    );
  }
}

export default App;
