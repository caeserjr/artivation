const {
  toBotAccount,
  toCommercialAccount,
} = require("../../models/transfers/transfers");
const Joi = require("@hapi/joi");


module.exports = [
  {
    method: "POST",
    path: "/transfer/bot",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          otp: Joi.string(),
          action: Joi.string(),
        }),
      },
      description: "Internal Transfer",
      notes: "Transfers to BOT Account",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await toBotAccount(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/transfer/commercial",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          otp: Joi.string(),
          action: Joi.string(),
        }),
      },
      description: "Internal Transfer",
      notes: "Transfers to Commercial Account",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await toCommercialAccount(h.payload);
        return ls;
      },
    },
  },
];
