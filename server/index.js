const Hapi = require("@hapi/hapi");
const Jwt = require("@hapi/jwt");
const jwt = require("jsonwebtoken");
const config = require("./config/config");

var auth = require("./routes/auth/auth");
var transfers = require("./routes/transfers/transfers");
var accountDetails = require("./routes/account/account");
const { TOKEN_KEY } = require("./config/config");
const { validateToken } = require("./utils");

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
      iss: "Bank of Tanzania",
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
  server.route(transfers);
  server.route(accountDetails);

  await server.start();

  console.log("\nartivation v1.0");
  console.log("server running at:", server.info.uri);
  // Logger.writeLog("🚀Server started...");
};
init();
