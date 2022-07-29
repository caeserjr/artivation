const RC = require("parse-strings-in-object")(
  require("rc")("API", require("./dbconnection.json"))
);
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "../.env") });

const getOrDefault = (value, defaultValue) => {
  if (value === undefined) {
    return defaultValue;
  }

  return value;
};

const SERVICES_BASE_URL = "172.26.40.11";
const TOKEN_KEY = `Ns[.T35cAb"7g ^ gg51Yl]:xO{NC[? d`;
const APP_NAME = "Artivation";

module.exports = {
  TOKEN_KEY: process.env.TOKEN_KEY || TOKEN_KEY,
  APP_NAME: process.env.APP_NAME || APP_NAME,
  PORT: process.env.PORT || RC.PORT,
  HOST: RC.HOST,
  LOGS_PATH: process.env.LOGS_PATH || "",
  ADMIN_SERVICE_URL:
    process.env.REACT_APP_ADMIN_SERVICE_URL || `${SERVICES_BASE_URL}: 8080`,
  ACCOUNT_SERVICE_URL:
    process.env.REACT_APP_ACCOUNT_SERVICE_URL || `${SERVICES_BASE_URL}: 9093`,
};
