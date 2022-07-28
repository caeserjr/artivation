const moment = require("moment");
const config = require("../../config/config");
const path = require("path");

const fs = require("fs");

let logsFolder = path.join(__dirname, "../../logs");

const writeLog = async (message = "") => {
  if (message.trim() !== "") {
    /* Create logs folder if not exists */
    if (!fs.existsSync(logsFolder)) {
      try {
        fs.mkdirSync(logsFolder);
      } catch (err) {
        console.log(err?.message);
        throw new Error(
          "************ Error creating logs folder ************",
          err?.message
        );
      }
    }
    let _fileName = moment().format("YYYY-MMM-DD");
    /* Create today's log file if not exists */
    if (!fs.existsSync(`${logsFolder}/${_fileName}.log`)) {
      try {
        fs.writeFileSync(
          `${logsFolder}/${_fileName}.log`,
          "***************** LOG FILE START *******************\n"
        );
      } catch (err) {
        console.log(err?.message);
        throw new Error(
          "************ Error creating today's log file ************",
          err?.message
        );
      }
    }

    //write new log message
    let _toWrite = `[${moment().format("DD-MMM-YYYY HH:mm:ss")}] ${message}\n`;
    fs.appendFileSync(`${logsFolder}/${_fileName}.log`, _toWrite, (err) => {
      if (err) {
        throw new Error(err?.message);
      }
    });
  } else {
    console.log("***** Logger skipped empty message ******");
  }
};

module.exports = {
  writeLog,
};
