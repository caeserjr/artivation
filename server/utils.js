const { TOKEN_KEY, APP_NAME } = require("./config/config");
const Jwt = require("@hapi/jwt");
const jwt = require("jsonwebtoken");
const jwt_decode = require("jwt-decode");
const { successMessage } = require("./lib/constants/common");

const generateOTP = (length = 4) => {
  var result = "";
  var characters = "0123456789";
  var charactersLength = characters.length;
  for (var i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
};

const validateOTP = () => {
  return true;
};

const generateToken = async (email) => {
  let currentTime = Date.now();
  const token = jwt.sign(
    {
      aud: false,
      iss: "Artivation",
      sub: false,
      email: email,
      generatedAt: currentTime,
    },
    TOKEN_KEY,
    {
      expiresIn: "2h",
    }
  );
  return token;
};

const validateToken = async (token) => {
  let newToken = String(token).split(" ")[1];
  return jwt.verify(
    newToken,
    TOKEN_KEY,
    {
      iss: "Artivation",
      aud: false,
      sub: false,
      nbf: true,
    },
    (err, verifiedJwt) => {
      let _token = null;

      if (err) {
        return {
          isValid: false,
        };
      } else {
        return {
          isValid: true,
          renewedToken: _token,
        };
      }
    }
  );
};

const renewToken = async (email) => {
  let newToken = await generateToken(email);
  return successMessage(newToken);
}

let sendEmail = (userObj) => {
  let mySubject = APP_NAME + " - Notification";
  let myBody =
    `<p> Dear  ${userObj.FULL_NAME} </p>
    <p>` +
    userObj.MSGBODY +
    ` <br/><br/>
    The link is ` +
    userObj.URL +
    ` to login.</p> 
    <p>Thank you</p>`;

  let otpTemplate = {
    subject: mySubject,
    body: myBody,
  };
  let verifyResult = { EMAIL: userObj.EMAIL };
  let mailsend = mail.sendMail(verifyResult, otpTemplate);
};

module.exports = {
  generateToken,
  validateToken,
  renewToken,
  sendEmail,
  generateOTP,
  validateOTP,
};
