
const config = require("../../config/config");
const Logger = require("../logger/logger");


const getServiceProviders = async (queryString) => {
  try {
    return [];
  } catch (error) {
    throw new Error(`No beneficiaries found.`);
  }
};



module.exports = { getServiceProviders };
