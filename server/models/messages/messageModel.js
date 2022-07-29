
const { error } = require("@hapi/joi/lib/base");
const config = require("../../config/config");
const { successMessage, errorMessage } = require("../../lib/constants/common");
const Logger = require("../logger/logger");
const moment = require("moment");


const getConversations = async ({ userId }) => {
  console.log("🚀 ~ file: messageModel.js ~ line 9 ~ getConversations ~ userId", userId)
  //! get conversation and their messages from database
  if (true) {
    return successMessage([
      {
        userId: 1,
        chatId: 1,
        sender: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        sender: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        sender: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        sender: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
    ])
  } else {
    return errorMessage("No beneficiaries found.")
  }
};

const getMessages = async (chatId) => {
  if (true) {
    return successMessage([
      {
        chatId: 1,
        sender: 2,
        date: moment().subtract(2, "days").format("DD-MM-YYYY HH:mm:ss").toString(),
        content: "Hi there",
        unread: true,
      },
      {
        chatId: 1,
        sender: 1,
        date: moment().subtract(2, "days").format("DD-MM-YYYY HH:mm:ss"),
        content: "Hello",
        unread: true,
      },
      {
        chatId: 1,
        sender: 2,
        date: moment().subtract(1, "hours").format("DD-MM-YYYY HH:mm:ss"),
        content: "How are you?",
        unread: false,
      },
      {
        chatId: 1,
        sender: 1,
        date: moment().format("DD-MM-YYYY HH:mm:ss"),
        content: "Am okie, wbu?",
        unread: true,
      },
    ])
  } else {
    return errorMessage("No beneficiaries found.")
  }
};

const postMessages = async () => {
  try {
    if (true) {
      return successMessage("Messages added successfully.")
    }
  } catch (error) {
    return errorMessage(`No beneficiaries found.`);
  }
}

const updateMessages = async () => {
  try {
    if (true) {
      return successMessage("Messages updated successfully.");
    }
  } catch (error) {
    return errorMessage(`No beneficiaries found.`);
  }
}

module.exports = { getMessages, getConversations, postMessages, updateMessages };
