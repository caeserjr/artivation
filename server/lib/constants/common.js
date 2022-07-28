const userObjects = [];

const successMessage = (msg) => {
  return { status: "success", data: msg }
}

const errorMessage = (msg) => {
  return { status: "error", data: msg }
}

const addToUserObject = (fileNumber, payload) => {
  let index = userObjects.findIndex((i) => i.fileNumber === fileNumber);
  if (index === -1) {
    userObjects.push(payload);
  } else {
    userObjects[index] = payload;
  }
  return true;
};

const removeUserObject = (fileNumber) => {
  let index = userObjects.findIndex((i) => i.fileNumber === fileNumber);
  if (index > -1) {
    userObjects.splice(index, 1);
    return true;
  }
  return false;
};

module.exports = {
  userObjects,
  addToUserObject,
  removeUserObject,
  successMessage,
  errorMessage,
};
