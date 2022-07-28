
const config = require("../../config/config");
const { successMessage, errorMessage } = require("../../lib/constants/common");
const Logger = require("../logger/logger");

const checkBalance = async (fileNumber) => {
  if (fileNumber) {
    try {
      //! hit backend request balances
      return successMessage({
        balance: 22000000
      });
    } catch (error) {
      errorMessage(error.message);
    }
  } else {
    errorMessage(error.message);
  }
};

module.exports = { checkBalance };
