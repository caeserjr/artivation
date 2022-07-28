const config = require("../../config/config");
const Logger = require("../logger/logger");


const toBotAccount = async ({ username, password }) => {
  let dbCon = createConnection();
  let _query = dbCon("RMU_TEMPTAB").select("FNAME").where({ FNAME: fileName });

  let result = await _query
    .then((data) => {
      if (data.length > 0) {
        return true;
      } else return false;
    })
    .catch((err) => {
      console.log("Error", err?.message);
      Logger.writeLog(`${err}`);
      throw new Error(err?.message);
    })
    .finally(() => {
      dbCon.destroy();
    });

  return result;
};
const toCommercialAccount = async ({ username, password }) => {
  let dbCon = createConnection();
  let _query = dbCon("RMU_TEMPTAB").select("FNAME").where({ FNAME: fileName });

  let result = await _query
    .then((data) => {
      if (data.length > 0) {
        return true;
      } else return false;
    })
    .catch((err) => {
      console.log("Error", err?.message);
      Logger.writeLog(`${err}`);
      throw new Error(err?.message);
    })
    .finally(() => {
      dbCon.destroy();
    });

  return result;
};

module.exports = {
  toBotAccount,
  toCommercialAccount,
};
