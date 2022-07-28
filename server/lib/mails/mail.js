const nodemailer = require("nodemailer");
//const Logger = require("../logger");

let sendMail = async function (verifyResult, otpTemplate) {
  var transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST || "192.168.6.174", //"owa.bot.go.tz",
    port: process.env.SMTP_PORT || 25,
    secure: false, // true for 465, false for other ports
    auth: {
      // user: 'fsr',
      // pass: 'Password02'
      user: "noreply@bot.go.tz",
      pass: "BOTmaster123",
    },
    tls: {
      // The line below will enable the email not to fail on invalid certificates
      rejectUnauthorized: false,
    },
  });
  var mailOptions = {
    from: "noreply@bot.go.tz",
    to:
      verifyResult && verifyResult.EMAIL !== undefined
        ? verifyResult.EMAIL
        : null,
    subject: otpTemplate ? otpTemplate.subject : null,
    html: otpTemplate ? otpTemplate.body : null,
  };

  await transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      //Logger.debug(`########## Unable to send mail to  : ${JSON.stringify(verifyResult.EMAIL)} ##########`)
      // Logger.debug(`########## Send mail error  : ${JSON.stringify(error)} ##########`)
    } else {
      // Logger.info(`########## Mail sent response  : ${JSON.stringify(info.response)}  ##########`)
      // Logger.info(`########## Mail sent succesfully to  : ${JSON.stringify(verifyResult.EMAIL)}  ##########`)
    }
  });
};

module.exports = {
  sendMail,
};
