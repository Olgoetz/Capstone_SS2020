const express = require("express");

const app = express();

// Init Middleware
app.use(express.json({ extended: false }));

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.set("json spaces", 20);

app.get("/", (req, res) => res.send("API is running!"));

app.use("/api/users", require("./routes/api/users"));

module.exports = app;
