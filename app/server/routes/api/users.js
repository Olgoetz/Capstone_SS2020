const express = require("express");
const router = express.Router();
const users = require("./constants");
router.get("/", (req, res) => {
  try {
    res.json(users);
  } catch (err) {
    console.err(err.message);
    res.stattus(500).send("Server Error!");
  }
});

module.exports = router;
