
const Joi = require("@hapi/joi");
const { getArtPieces, postArtPiece } = require("../../models/artPieces/artPieceModel");


module.exports = [
  {
    method: "GET",
    path: "/artPieces",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      // validate: {
      //   payload: Joi.object({
      //     userId: Joi.number(),
      //   }),
      // },
      description: "Get Art piece List",
      notes: "Gets a list of art pieces",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await getArtPieces();
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/addArtPiece",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      validate: {
        payload: Joi.object({
          sender: Joi.number(),
          receiver: Joi.number(),
          content: Joi.string(),
          date: Joi.string(),
        }),
      },
      description: "Add Art piece",
      notes: "Adds a piece to the list of art pieces",
      tags: ["api"],
      handler: async (h) => {
        let ls = null;
        ls = await postArtPiece(h.payload);
        return ls;
      },
    },
  },
];
