"use strict";

const mail = require("./mail");
const mailTemplate = require("./mailtemplates");

module.exports = {
  sendMail: mail.sendMail(),
  OTPTemplate: mailTemplate.OTPNewUser(),
  successChangePasswordTemplate: mailTemplate.successChangePasswordTemplate,
};
