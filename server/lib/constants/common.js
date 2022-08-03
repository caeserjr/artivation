const userObjects = [];

const userData = [{
  userId: 1,
  firstName: "Ghalib",
  middleName: "A",
  lastName: "Ali",
  imageUrl: "assets/pieces/8.jpg",
  phoneNumber: 0712160406,
  userName: "caeserjr"
}, {
  userId: 2,
  firstName: "Saida",
  middleName: "A",
  lastName: "Mzee",
  imageUrl: "assets/pieces/4.jpg",
  phoneNumber: 0712160406,
  userName: "sambaseif",
}, {
  userId: 3,
  firstName: "Salhiya",
  middleName: "G",
  lastName: "Ali",
  imageUrl: "assets/pieces/7.jpg",
  phoneNumber: 0712160406,
  userName: "naggato",
}, {
  userId: 4,
  firstName: "Naruto",
  middleName: "J",
  lastName: "Uzumaki",
  imageUrl: "assets/pieces/6.jpg",
  phoneNumber: 0712160406,
  userName: "jiraiya",
}, {
  userId: 5,
  firstName: "Ogata",
  middleName: "S",
  lastName: "Hiroyuki",
  imageUrl: "assets/pieces/1.jpg",
  phoneNumber: 0712160406,
  userName: "jiraiya",
}, {
  userId: 5,
  firstName: "Jinjuriki",
  middleName: "S",
  lastName: "Ten",
  imageUrl: "assets/pieces/6.jpg",
  phoneNumber: 0712160406,
  userName: "jiraiya",
}
]

const successMessage = (msg) => {
  return { status: "success", data: msg }
}

const errorMessage = (msg) => {
  return { status: "error", data: msg }
}

const addToUserObject = (email, payload) => {
  let index = userObjects.findIndex((i) => i.email === email);
  if (index === -1) {
    userObjects.push(payload);
  } else {
    userObjects[index] = payload;
  }
  return true;
};

const removeUserObject = (email) => {
  let index = userObjects.findIndex((i) => i.email === email);
  if (index > -1) {
    userObjects.splice(index, 1);
    return true;
  }
  return false;
};

module.exports = {
  userData,
  userObjects,
  addToUserObject,
  removeUserObject,
  successMessage,
  errorMessage,
};
