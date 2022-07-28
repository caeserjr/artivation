const { response } = require("@hapi/inert/lib/file");
const config = require("../../config/config");
const {
  userObjects,
  serverMessages,
  addToUserObject,
  removeUserObject,
  successMessage,
  errorMessage
} = require("../../lib/constants/common");
const { generateOTP, generateToken, validateToken } = require("../../utils");
const Logger = require("../logger/logger");


const userLogin = async ({ fileNumber, password }) => {
  let otp = 1234; //generateOTP();

  console.log("🚀 ~ file: auth.js ~ line 15 ~ userLogin ~ otp", otp);
  const reqOpts = {
    headers: {
      // Authorization: `Bearer ${activeSession?.token}`,
      "Content-Type": "application/json",
      accept: "application/json",
    },
    validateStatus: (status) => {
      return status < 500;
    },
  };
  if (password != "password") return errorMessage("Invalid credentials provided.");

  try {
    // const response = await adminServiceApi.post(
    //   "/account/resetPin",
    //   reqOpts
    // );
    if (true) {
      //! save fileNumber and object from server response
      let payload = {
        fileNumber: fileNumber,
        otp: otp,
        data: {
          userDetails: {
            fileNumber: fileNumber,
            fullName: "Mbwana S Athman",
            accountNumber: "9923131930",
            mobileNumber: "077895622",
            balanceCode: "90000000000",
            level: 2,
            payrollStatus: 12345,
            emailStat: "msathman@bot.go.tz",
            transCode: "TX1234",
          },
        },
      };

      //* check if file number exists in the user object
      addToUserObject(fileNumber, payload);
      return successMessage("Login successful.");
    } else {
      return errorMessage("Invalid credentials provided.");
    }
    // return response;
  } catch (error) {
    return errorMessage(error.message);
  }
};

const changePassword = async ({ fileNumber, currentPassword, newPassword }) => {

  // const activeSession = localStorage.getItem("activeSession")
  //   ? JSON.parse(localStorage.getItem("activeSession"))
  //   : null;
  // const reqOpts = {
  //   headers: {
  //     Authorization: `Bearer ${activeSession.token}`,
  //     "Content-Type": "application/json",
  //     accept: "application/json",
  //   },
  //   validateStatus: (status) => {
  //     return status < 500;
  //   },
  // };
  try {
    // const response = await adminServiceApi.post(
    //   "/account/resetPassword",
    //   reqOpts
    // );

    if (currentPassword === "password") {
      return successMessage("Password changed successfully.");
    } else {
      return errorMessage("The password provided was incorrect.");
    }
  } catch (error) { }
};

const changePortalPin = async ({ fileNumber, newPin, currentPin }) => {

  if (parseInt(currentPin) === 1234) {
    return successMessage("PIN changed successfully");
  } else {
    return errorMessage("Invalid PIN provided.");
  }
  // try {
  //   const activeSession = localStorage.getItem("activeSession")
  //     ? JSON.parse(localStorage.getItem("activeSession"))
  //     : null;
  //   const reqOpts = {
  //     headers: {
  //       Authorization: `Bearer ${activeSession.token}`,
  //       "Content-Type": "application/json",
  //       accept: "application/json",
  //     },
  //     validateStatus: (status) => {
  //       return status < 500;
  //     },
  //   };
  //   try {
  //     const response = await adminServiceApi.post("/account/resetPin", reqOpts);
  //     return response;
  //   } catch (error) {
  //     throw new Error(error.message);
  //   }
  // } catch (error) { }
};

const verifyPin = async ({ fileNumber, pin }) => {
  const reqOpts = {
    headers: {
      // Authorization: `Bearer ${activeSession?.token}`,
      "Content-Type": "application/json",
      accept: "application/json",
    },
    validateStatus: (status) => {
      return status < 500;
    },
  };
  try {
    // const response = await adminServiceApi.post("/account/resetPin", reqOpts);
    if (parseInt(pin) === 1234) {
      return successMessage("valid");
    }
    return errorMessage("Invalid PIN provided.");
  } catch (error) {
    return errorMessage(error.message);
  }
};

const verifyOTP = async ({ fileNumber, otp, action }) => {
  if (userObjects.length > 0) {
    if (action === "login") {
      let _isValid = userObjects.find(
        (user) => user.fileNumber === fileNumber && user.otp == otp
      );

      if (_isValid) {
        //* create payload to be sent to user
        let payload = _isValid.data.userDetails;

        //* remove item from user objects
        removeUserObject(fileNumber);

        //* generate token
        let accessToken = await generateToken(fileNumber);
        return {
          status: "success",
          data: {
            userDetails: payload,
            accessToken: accessToken,
          },
        };
      } else {
        return errorMessage("Invalid OTP provided.");
      }
    } else if ("transfer") {
      //* validate otp from backend
      return successMessage("valid");
    } else {
      return errorMessage("Invalid OTP provided.");
    }
  } else {
    return errorMessage("An error occurred while processing the request.");
  }
};

const requestOTP = async ({ fileNumber }) => {
  let payload = {};
  let otp = generateOTP();
  const reqOpts = {
    headers: {
      // Authorization: `Bearer ${activeSession?.token}`,
      "Content-Type": "application/json",
      accept: "application/json",
    },
    validateStatus: (status) => {
      return status < 500;
    },
  };
  try {
    //! todo send created otp to backend
    // const response = await adminServiceApi.post("/account/requestOTP", reqOpts);
    if (true /* response.code === 200 */) {
      //* check if file number exists in the user object
      addToUserObject(fileNumber, payload);
      return successMessage(otp);
    }
  } catch (error) {
    return errorMessage(error.message);
  }
};


module.exports = {
  userLogin,
  changePassword,
  changePortalPin,
  verifyPin,
  verifyOTP,
  requestOTP,
};
