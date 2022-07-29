const {
  getMessages, postMessages, updateMessages, getConversations
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
    method: "PUT",
    path: "/messages",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      description: "Post Messages List",
      notes: "Post arrays or objects of messages",
      tags: ["api"],
      handler: async () => {
        let posted = null;
        posted = await updateMessages();
        return posted;
      },
    },
  },
];
