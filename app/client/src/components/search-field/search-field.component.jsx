import React from "react";

import "./search-field.styles.css";

export const SearchField = (props) => (
  <input
    className="search-field"
    type="search"
    placeholder="search monsters"
    onChange={props.handleOnSearchChange}
  />
);
