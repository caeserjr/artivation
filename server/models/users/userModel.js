
const { error } = require("@hapi/joi/lib/base");
const config = require("../../config/config");
const { successMessage, errorMessage } = require("../../lib/constants/common");
const Logger = require("../logger/logger");


const getUser = async () => {
  try {
    if (true) {
      return successMessage([{
        userId: 1,
        firstName: "Ghalib",
        middleName: "A",
        lastName: "Ali",
        imageUrl: "assets/pieces/8.jpg",
        phoneNumber: 0712160406,
        userName: "caeserjr"
      }, {
        userId: 2,
        firstName: "Saida",
        middleName: "A",
        lastName: "Mzee",
        imageUrl: "assets/pieces/4.jpg",
        phoneNumber: 0712160406,
        userName: "sambaseif",
      }
        , {
        userId: 3,
        firstName: "Salhiya",
        middleName: "G",
        lastName: "Ali",
        imageUrl: "assets/pieces/7.jpg",
        phoneNumber: 0712160406,
        userName: "naggato",
      }
        , {
        userId: 4,
        firstName: "Naruto",
        middleName: "J",
        lastName: "Uzumaki",
        imageUrl: "assets/pieces/6.jpg",
        phoneNumber: 0712160406,
        userName: "jiraiya",
      }, {
        userId: 4,
        firstName: "Ogata",
        middleName: "S",
        lastName: "Hiroyuki",
        imageUrl: "assets/pieces/1.jpg",
        phoneNumber: 0712160406,
        userName: "jiraiya",
      }
      ])
    } else {
      return errorMessage("No users found.")
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

module.exports = { getUser, postUser, updateUser };
