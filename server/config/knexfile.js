"use strict";

const Config = require("./config");

module.exports = {
  client: "oracledb",
  connection: {
    host:
      Config.DATABASE.connection.host + ":" + Config.DATABASE.connection.port,
    user: Config.DATABASE.connection.user,
    password: Config.DATABASE.connection.password,
    database: Config.DATABASE.connection.database,
  },
};
