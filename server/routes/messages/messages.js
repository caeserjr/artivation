const {
  getMessages, postMessage, updateMessages, getConversations
} = require("../../models/messages/messageModel");
const Joi = require("@hapi/joi");


module.exports = [
  {
    method: "POST",
    path: "/conversations",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      validate: {
        payload: Joi.object({
          userId: Joi.number(),
        }),
      },
      description: "Get Conversation List",
      notes: "Gets a list of conversation",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await getConversations(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/messages",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      validate: {
        payload: Joi.object({
          chatId: Joi.number(),
        }),
      },
      description: "Get Conversation messages",
      notes: "Gets a list of messages",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await getMessages(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/sendMessage",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      validate: {
        payload: Joi.object({
          sender: Joi.number(),
          receiver: Joi.number(),
          content: Joi.string(),
          date: Joi.string(),
        }),
      },
      description: "Get Conversation messages",
      notes: "Gets a list of messages",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await postMessage(h.payload);
        return ls;
      },
    },
  },
];
