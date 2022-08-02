
const { error } = require("@hapi/joi/lib/base");
const config = require("../../config/config");
const { successMessage, errorMessage } = require("../../lib/constants/common");
const Logger = require("../logger/logger");
const moment = require("moment");


const getArtPieces = async () => {
  console.log("🚀 ~ file: artPieceModel.js ~ line 83 ~ getArtPieces ~ getArtPieces")

  //! get conversation and their messages from database

  if (true) {
    return successMessage([
      {
        "pieceName": "Jiraiya Sensei",
        "price": 1200,
        "pieceImage": "assets/pieces/1.jpg",
        "pieceDesc": "Jiraiya Sage Mode",
        "pieceDate": moment().subtract(17, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 1,
        "category": 1,
      },
      {
        "pieceName": "Gintama",
        "price": 1200,
        "pieceImage": "assets/pieces/2.jpg",
        "pieceDesc": "Team Gintama",
        "pieceDate": moment().subtract(1, "year").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 1,
      },
      {
        "pieceName": "Fire Force",
        "price": 1200,
        "pieceImage": "assets/pieces/3.jpg",
        "pieceDesc": "Shinra Kusakabe",
        "pieceDate": moment().subtract(7, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 2,
      },
      {
        "pieceName": "Galaxy",
        "price": 600,
        "pieceImage": "assets/pieces/9.jpg",
        "pieceDesc": "Complete Squad 8",
        "pieceDate": moment().subtract(2, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 3,
        "category": 4
      },
      {
        "pieceName": "Squad 8",
        "price": 600,
        "pieceImage": "assets/pieces/4.jpg",
        "pieceDesc": "Complete Squad 8",
        "pieceDate": moment().subtract(2, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 4
      },
      {
        "pieceName": "Boku no hero",
        "price": 800,
        "pieceImage": "assets/pieces/5.jpg",
        "pieceDesc": "Suicide Squad Boku no hero",
        "pieceDate": moment().subtract(1, "years").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 1
      },
      {
        "pieceName": "Gintama san",
        "price": 240,
        "pieceImage": "assets/pieces/6.jpg",
        "pieceDesc": "Gintama taking a stroll",
        "pieceDate": moment().subtract(7, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 2
      },

      {
        "pieceName": "Shadowy",
        "price": 300,
        "pieceImage": "assets/pieces/7.jpg",
        "pieceDesc": "Shadowy Character",
        "pieceDate": moment().subtract(7, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 5
      },
      {
        "pieceName": "Justice League",
        "price": 500,
        "pieceImage": "assets/pieces/8.jpg",
        "pieceDesc": "The Justice League",
        "pieceDate": moment().subtract(15, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 4
      },
    ])
  } else {
    return errorMessage("No beneficiaries found.")
  }
};

const postArtPiece = async (payload) => {
  console.log("🚀 ~ file: messageModel.js ~ line 318 ~ postedMessage ~ payload", payload)
  try {
    if (true) {
      return successMessage("Messages added successfully.")
    }
  } catch (error) {
    return errorMessage(`No beneficiaries found.`);
  }
}


module.exports = { getArtPieces, postArtPiece };
