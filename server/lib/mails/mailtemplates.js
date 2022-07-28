"use strict";

let OTPTemplate = async function (LAST_NAME, OTP, VALIDITY) {
  return {
    subject: `Input System Name Password Reset Request`,
    body: `<p> Dear  ${LAST_NAME} </p>
  <p>To change password, please use the following One Time Password (OTP):</p>

   <p><h2><b>${OTP}</b></h2></p>
   <p>Do not share this OTP with anyone. 
   This code is valid for only ${parseInt(VALIDITY) / 60} minutes.
   Input System Name takes your account security very seriously.
    If you receive a suspicious email with a link to update your account information, do not click on the link--instead, 
    report the email to the Bank of Tanzania for investigation.</p>

   <p>Thank you</p>`,
  };
};

let OTPNewUser = async function (FULL_NAME, URL, USERNAME, PASSWORD) {
  console.log(FULL_NAME + " - " + URL + " - " + USERNAME + " - " + PASSWORD);
  return {
    subject: `User Access`,
    body:
      `<p> Dear  ${FULL_NAME} </p>
   <p>Please receive credentials as below, <br/> Username: ` +
      USERNAME +
      ` <br/>
   Password: ` +
      PASSWORD +
      `<br/>
   Use the link ` +
      URL +
      ` to login.</p> 
   <p>Thank you</p>`,
  };
};

let successChangePasswordTemplate = async function (LAST_NAME) {
  return {
    subject: `Input System Name Password Change Confirmation`,
    body: ` <p> Dear  ${LAST_NAME} </p>

      <p>We just wanted to confirm that you've changed your password. If you didn't change your password, please reset your password immediately <a href="#">here</a>.</p>
      <p>It’s important that you let us know because it helps us prevent unauthorized persons from accessing your account information.</p>
      <br>
      <p>Tips to help protect your password:</p>
      <p><ul>
      <li>Never share your password or security questions with anyone.</li>
      </li>Create passwords that are hard to guess and don't use personal information. Be sure to include uppercase and lowercase letters, numbers, and symbols.</li>
      <li>Use different passwords for each of your system accounts.</li>
      </ul></p>
      <p>Sincerely,</p>
      Bank of Tanzania`,
  };
};

module.exports = {
  OTPTemplate,
  successChangePasswordTemplate,
  OTPNewUser,
};
