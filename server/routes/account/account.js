const Joi = require("@hapi/joi");
const { checkBalance } = require("../../models/account/account");

module.exports = [
  {
    method: "POST",
    path: "/account/balance",
    options: {
      description: "Account Balance",
      notes: "Gets account balance information",
      tags: ["api"],
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await checkBalance(h.payload);
        return ls;
      },
    },
  },
];
