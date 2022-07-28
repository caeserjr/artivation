
const { error } = require("@hapi/joi/lib/base");
const config = require("../../config/config");
const { successMessage, errorMessage } = require("../../lib/constants/common");
const Logger = require("../logger/logger");


const getBeneficiaries = async () => {
  try {
    if (true) {
      return successMessage([{
        "beneficiaryId": "beneficiaryId",
        "registeredDate": "registeredDate",
        "bankCode": "bankCode",
        "bankName": "bankName",
        "status": "status",
        "accountNumber": "accountNumber",
        "beneficiaryName": "beneficiaryName",
      }])
    } else {
      return errorMessage("No beneficiaries found.")
    }
  } catch (error) {
    return errorMessage(`An error occurred.`);
  }
};

const postBeneficiaries = async () => {
  try {
    if (true) {
      return successMessage("Beneficiary added successfully.")
    }
  } catch (error) {
    return errorMessage(`No beneficiaries found.`);
  }
}

const updateBeneficiaries = async () => {
  try {
    if (true) {
      return successMessage("Beneficiary updated successfully.");
    }
  } catch (error) {
    return errorMessage(`No beneficiaries found.`);
  }
}

module.exports = { getBeneficiaries, postBeneficiaries, updateBeneficiaries };
