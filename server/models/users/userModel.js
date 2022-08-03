
const { error } = require("@hapi/joi/lib/base");
const config = require("../../config/config");
const { successMessage, errorMessage, userData } = require("../../lib/constants/common");
const Logger = require("../logger/logger");


const getUsers = async ({ userId }) => {
  try {
    if (userId) {
      let user = userData.find(user => parseInt(user.userId) === parseInt(userId));
      return successMessage([user]);
    } else {
      //! get all users
      return successMessage(userData);
    }
  } catch (error) {
    return errorMessage(`An error occurred.`);
  }
};

const postUser = async () => {
  try {
    if (true) {
      return successMessage("Messages added successfully.")
    }
  } catch (error) {
    return errorMessage(`No users found.`);
  }
}

const updateUser = async () => {
  try {
    if (true) {
      return successMessage("Messages updated successfully.");
    }
  } catch (error) {
    return errorMessage(`No users found.`);
  }
}

module.exports = { getUsers, postUser, updateUser };
