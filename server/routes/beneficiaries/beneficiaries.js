const {
  getBeneficiaries, postBeneficiaries, updateBeneficiaries
} = require("../../models/beneficiaries/beneficiaries");

module.exports = [
  {
    method: "POST",
    path: "/beneficiaries",
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
      description: "Get Beneficiary List",
      notes: "Gets a list of beneficiaries",
      tags: ["api"],
      handler: async () => {
        let ls = null;
        ls = await getBeneficiaries();
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/beneficiaries",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      description: "Post Beneficiary List",
      notes: "Post arrays or objects of beneficiaries",
      tags: ["api"],
      handler: async () => {
        let posted = null;
        posted = await postBeneficiaries();
        return posted;
      },
    },
  },
  {
    method: "PUT",
    path: "/beneficiaries",
    auth: {
      strategy: "authStrategy",
    },
    options: {
      description: "Post Beneficiary List",
      notes: "Post arrays or objects of beneficiaries",
      tags: ["api"],
      handler: async () => {
        let posted = null;
        posted = await updateBeneficiaries();
        return posted;
      },
    },
  },
];
