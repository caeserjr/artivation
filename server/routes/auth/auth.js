const {
  userLogin,
  verifyPin,
  verifyOTP,
  requestOTP,
  changePassword,
  changePortalPin,
} = require("../../models/auth/auth");
const Joi = require("@hapi/joi");
const { params } = require("@hapi/hapi/lib/validation");
const { renewToken } = require("../../utils");

module.exports = [
  {
    method: "POST",
    path: "/auth/login",
    options: {
      description: "User authentication method",
      notes: "Authenticates the user",
      tags: ["api"],
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          password: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await userLogin(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/otp/request",
    options: {
      description: "request OTP",
      notes: "Requests OTP from the server",
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
        ls = await requestOTP(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/otp/verify",
    options: {
      description: "verify OTP",
      notes: "Verifies the provided OTP",
      tags: ["api"],
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          otp: Joi.string(),
          action: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await verifyOTP(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/pin/change",
    options: {
      description: "Changes the provided pin",
      notes: "Change the Portal PIN",
      tags: ["api"],
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          currentPin: Joi.string(),
          newPin: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await changePortalPin(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/pin/verify",
    options: {
      description: "Verifies the provided pin",
      notes: "Verifies the PIN",
      tags: ["api"],
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          pin: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await verifyPin(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/password/change",
    options: {
      description: "Verifies the provided pin",
      notes: "Verifies the PIN",
      tags: ["api"],
      auth: {
        strategy: "authStrategy",
      },
      validate: {
        payload: Joi.object({
          email: Joi.string(),
          currentPassword: Joi.string(),
          newPassword: Joi.string(),
        }),
      },
      handler: async (h) => {
        let ls = null;
        ls = await changePassword(h.payload);
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/auth/renewToken",
    options: {
      description: "Renews user token",
      notes: "Renews token",
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
        ls = await renewToken(h.payload);
        return ls;
      },
    },
  },
];
