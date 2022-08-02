
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
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
      {
        userId: 1,
        chatId: 1,
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
      {
        userId: 1,
        chatId: 1,
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
      {
        userId: 1,
        chatId: 1,
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
      {
        userId: 1,
        chatId: 1,
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
        senderName: "Ogata S Hiroyuki",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/1.jpg",
        content: "Baka",
        unread: true,
      },
      {
        userId: 1,
        chatId: 1,
        senderId: 4,
        senderName: "Naruto Uzumaki",
        senderImage: "assets/pieces/6.jpg",
        date: moment().format("HH:mm"),
        content: "Naruto kun",
        unread: true,
      },
      {
        userId: 1,
        chatId: 2,
        senderId: 2,
        senderName: "Nagato Uzumaki",
        senderImage: "assets/pieces/4.jpg",
        date: moment().format("HH:mm"),
        content: "Hi",
        unread: true,
      },
      {
        userId: 1,
        chatId: 3,
        senderId: 3,
        senderName: "Salhiya G Ali",
        date: moment().format("HH:mm"),
        senderImage: "assets/pieces/7.jpg",
        content: "Baka",
        unread: false,
      },
      {
        userId: 1,
        chatId: 4,
        senderId: 4,
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
        senderId: 2,
        date: moment().subtract(7, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        content: "Hi there",
        senderImage: "assets/pieces/1.jpg",
        unread: true,
      },
      {
        chatId: 1,
        senderId: 2,
        date: moment().subtract(2, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        content: "Helloooo!",
        senderImage: "assets/pieces/1.jpg",
        unread: true,
      },
      {
        chatId: 1,
        senderId: 1,
        date: moment().subtract(2, "days").format("YYYY-MM-DD HH:mm:ss"),
        content: "Hello",
        senderImage: "assets/pieces/1.jpg",
        unread: true,
      },
      {
        chatId: 1,
        senderId: 1,
        date: moment().subtract(1, "days").format("YYYY-MM-DD HH:mm:ss"),
        content: "Long time no see.",
        senderImage: "assets/pieces/1.jpg",
        unread: true,
      },
      {
        chatId: 1,
        senderId: 2,
        date: moment().subtract(1, "hours").format("YYYY-MM-DD HH:mm:ss"),
        content: "How are you?",
        senderImage: "assets/pieces/1.jpg",
        unread: false,
      },
      {
        chatId: 1,
        senderId: 1,
        date: moment().subtract(1, "days").format("YYYY-MM-DD HH:mm:ss"),
        content: "Am okie, wbu?",
        senderImage: "assets/pieces/1.jpg",
        unread: true,
      },
    ])
  } else {
    return errorMessage("No beneficiaries found.")
  }
};

const postMessage = async (payload) => {
  console.log("🚀 ~ file: messageModel.js ~ line 318 ~ postedMessage ~ payload", payload)
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

module.exports = { getMessages, getConversations, postMessage, updateMessages };
