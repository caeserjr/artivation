const Hapi = require("@hapi/hapi");
const Jwt = require("@hapi/jwt");
const jwt = require("jsonwebtoken");
const config = require("./config/config");

const { TOKEN_KEY } = require("./config/config");
const { validateToken } = require("./utils");

const users = require("./routes/users/users");
var auth = require("./routes/auth/auth");
var accountDetails = require("./routes/account/account");
const messages = require("./routes/messages/messages");
const artPieces = require("./routes/artPieces/artPieces");

const init = async () => {
  const server = new Hapi.Server({
    port: config.PORT,
    routes: {
      cors: {
        origin: ["*"],
        headers: [
          "Accept",
          "Authorization",
          "Content-Type",
          "If-None-Match",
          "consumer",
          "Origin",
          "message_type",
          "sender",
          "Referer",
          "User-Agent",
        ],
        maxAge: 60,
        credentials: false,
      },
    },
  });
  // await server.register(Jwt);

  await server.register([
    require("inert"),
    require("vision"),
    Jwt,
  ]);

  server.auth.strategy("authStrategy", "jwt", {
    keys: TOKEN_KEY,
    verify: {
      aud: false,
      iss: "Artivation",
      sub: false,
      nbf: true,
    },
    validate: async (request, h) => {
      let _validateToken = await validateToken(
        h.headers.authorization,
        h.payload
      );
      if (_validateToken?.renewedToken) {
        h.headers.renewedToken = _validateToken?.renewedToken;
      }
      return {
        isValid: _validateToken?.isValid,
      };
    },
  });

  server.route(auth);
  server.route(accountDetails);
  server.route(users);
  server.route(messages);
  server.route(artPieces);

  await server.start();

  console.log("\nartivation v1.0");
  console.log("server running at:", server.info.uri);
  // Logger.writeLog("🚀Server started...");
};
init();
