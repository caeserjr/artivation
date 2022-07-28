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
const TOKEN_KEY = "dntb2lzykm1z900D";
const APP_NAME = "BOT Mobile Banking";
const API_KEY = "keyfromServer";

module.exports = {
  TOKEN_KEY: process.env.TOKEN_KEY || TOKEN_KEY,
  APP_NAME: process.env.APP_NAME || APP_NAME,
  PORT: process.env.PORT || RC.PORT,
  HOST: RC.HOST,
  LOGS_PATH: process.env.LOGS_PATH || "",
  ADMIN_SERVICE_URL:
    process.env.REACT_APP_ADMIN_SERVICE_URL || `${SERVICES_BASE_URL}:8080`,
  ACCOUNT_SERVICE_URL:
    process.env.REACT_APP_ACCOUNT_SERVICE_URL || `${SERVICES_BASE_URL}:9093`,
  DATABASE: {
    client: process.env.DATABASE_DIALECT || RC.DATABASE.DIALECT,
    connection: {
      host: process.env.DATABASE_HOST || RC.DATABASE.HOST.replace(/\/$/, ""),
      port: process.env.DATABASE_PORT || RC.DATABASE.PORT,
      user: process.env.DATABASE_USER || RC.DATABASE.USER,
      password: process.env.DATABASE_PASSWORD || RC.DATABASE.PASSWORD,
      database: process.env.DATABASE_OR_SCHEMA || RC.DATABASE.DATABASE,
    },
    pool: {
      // minimum size
      min: getOrDefault(
        process.env.POOL_MIN_SIZE || RC.DATABASE.POOL_MIN_SIZE,
        2
      ),

      // maximum size
      max: getOrDefault(
        process.env.POOL_MAX_SIZE || RC.DATABASE.POOL_MAX_SIZE,
        10
      ),
      // acquire promises are rejected after this many milliseconds
      // if a resource cannot be acquired
      acquireTimeoutMillis: getOrDefault(
        process.env.ACQUIRE_TIMEOUT_MILLIS ||
        RC.DATABASE.ACQUIRE_TIMEOUT_MILLIS,
        30000
      ),

      // create operations are cancelled after this many milliseconds
      // if a resource cannot be acquired
      createTimeoutMillis: getOrDefault(
        process.env.CREATE_TIMEOUT_MILLIS || RC.DATABASE.CREATE_TIMEOUT_MILLIS,
        3000
      ),

      // destroy operations are awaited for at most this many milliseconds
      // new resources will be created after this timeout
      destroyTimeoutMillis: getOrDefault(
        process.env.DESTROY_TIMEOUT_MILLIS ||
        RC.DATABASE.DESTROY_TIMEOUT_MILLIS,
        5000
      ),

      // free resources are destroyed after this many milliseconds
      idleTimeoutMillis: getOrDefault(
        process.env.IDLE_TIMEOUT_MILLIS || RC.DATABASE.IDLE_TIMEOUT_MILLIS,
        30000
      ),

      // how often to check for idle resources to destroy
      reapIntervalMillis: getOrDefault(
        process.env.IDLE_TIMEOUT_MILLIS || RC.DATABASE.REAP_INTERVAL_MILLIS,
        1000
      ),

      // long long to idle after failed create before trying again
      createRetryIntervalMillis: getOrDefault(
        process.env.CREATE_RETRY_INTERVAL_MILLIS ||
        RC.DATABASE.CREATE_RETRY_INTERVAL_MILLIS,
        20
      ),
      // ping: function (conn, cb) { conn.query('SELECT 1', cb) }
    },
    debug: getOrDefault(RC.DATABASE.DEBUG, false),
  },
};
