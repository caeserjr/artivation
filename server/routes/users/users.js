const {
  getUsers, postUsers, updateUsers
} = require("../../models/users/userModel");

module.exports = [
  {
    method: "GET",
    path: "/users",
    options: {
      // auth: {
      //   strategy: "authStrategy",
      // },
      description: "Get User List",
      notes: "Gets a list of users",
      tags: ["api"],
      handler: async () => {
        let ls = null;
        ls = await getUsers();
        return ls;
      },
    },
  },
  {
    method: "POST",
    path: "/users",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      description: "Post User List",
      notes: "Post arrays or objects of users",
      tags: ["api"],
      handler: async () => {
        let posted = null;
        posted = await postUsers();
        return posted;
      },
    },
  },
  {
    method: "PUT",
    path: "/users",
    options: {
      auth: {
        strategy: "authStrategy",
      },
      description: "Post Users List",
      notes: "Post arrays or objects of users",
      tags: ["api"],
      handler: async () => {
        let posted = null;
        posted = await updateUsers();
        return posted;
      },
    },
  },
];
