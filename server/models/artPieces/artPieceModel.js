
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
        "price": 1200,
        "pieceId": 1,
        "pieceName": "Jiraiya Sensei",
        "pieceImage": "assets/pieces/1.jpg",
        "pieceDesc": "Jiraiya Sage Mode",
        "pieceDate": moment().subtract(17, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 1,
        "category": 1,
      },
      {
        "pieceId": 2,
        "price": 1200,
        "pieceName": "Gintama",
        "pieceImage": "assets/pieces/2.jpg",
        "pieceDesc": "Team Gintama",
        "pieceDate": moment().subtract(1, "year").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 2,
        "category": 1,
      },
      {
        "pieceId": 3,
        "price": 1200,
        "pieceName": "Fire Force",
        "pieceImage": "assets/pieces/3.jpg",
        "pieceDesc": "Shinra Kusakabe",
        "pieceDate": moment().subtract(7, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 3,
        "category": 2,
      },
      {
        "pieceId": 4,
        "pieceName": "Galaxy",
        "price": 600,
        "pieceImage": "assets/pieces/9.jpg",
        "pieceDesc": "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum fuga minima neque et officia quasi omnis excepturi, mollitia voluptates error modi nesciunt eius. Ad vitae fuga quis eveniet ea. Quod rerum sunt labore dolore ipsa ipsum minus quis! Sapiente at cupiditate repellat assumenda exercitationem dolorum! Id repudiandae eum autem animi est nobis nesciunt vero magni mollitia, nostrum, ipsum quas ea impedit placeat? Repudiandae velit minima, id ipsum minus libero tempore aliquid deserunt perspiciatis porro, est quos odio necessitatibus eligendi eum in quo eveniet quae consequatur adipisci cum laborum praesentium architecto? Necessitatibus maiores dolorem ducimus, molestias iste inventore nam aspernatur quisquam!",
        "pieceDate": moment().subtract(2, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 3,
        "category": 4
      },
      {
        "pieceId": 5,
        "price": 600,
        "pieceName": "Squad 8",
        "pieceImage": "assets/pieces/4.jpg",
        "pieceDesc": "Complete Squad 8",
        "pieceDate": moment().subtract(2, "months").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 4,
        "category": 4
      },
      {
        "pieceId": 6,
        "price": 800,
        "pieceName": "Boku no hero",
        "pieceImage": "assets/pieces/5.jpg",
        "pieceDesc": "Suicide Squad Boku no hero",
        "pieceDate": moment().subtract(1, "years").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 5,
        "category": 1
      },
      {
        "pieceId": 7,
        "pieceName": "Gintama san",
        "price": 240,
        "pieceImage": "assets/pieces/6.jpg",
        "pieceDesc": "Gintama taking a stroll",
        "pieceDate": moment().subtract(7, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 1,
        "category": 2
      },

      {
        "pieceId": 8,
        "pieceName": "Shadowy",
        "price": 300,
        "pieceImage": "assets/pieces/7.jpg",
        "pieceDesc": "Shadowy Character",
        "pieceDate": moment().subtract(7, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 4,
        "category": 5
      },
      {
        "pieceId": 9,
        "pieceName": "Justice League",
        "price": 500,
        "pieceImage": "assets/pieces/8.jpg",
        "pieceDesc": "The Justice League",
        "pieceDate": moment().subtract(15, "days").format("YYYY-MM-DD HH:mm:ss").toString(),
        "pieceArtist": 5,
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

const checkLikeStatus = async ({ pieceId }) => {
  console.log("🚀 ~ file: artPieceModel.js ~ line 125 ~ checkLikeStatus ~ pieceId", pieceId)
  try {
    if (pieceId === "2" || pieceId === "1" || pieceId === "4" || pieceId === "5") {
      return successMessage(true)
    }
    return successMessage(false);
  } catch (error) {
    return errorMessage("An error occurred while checking the status");
  }
}


module.exports = { getArtPieces, postArtPiece, checkLikeStatus };
