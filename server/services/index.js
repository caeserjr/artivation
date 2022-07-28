import axios from "axios";
const config = require("../config/config");
import { signOut } from "../features/auth/authSlice";

let store;

export const injectStore = (_store) => {
  store = _store;
};

//*ADMIN
export const adminServiceApi = axios.create({
  baseURL: `http://${config.ACCOUNT_SERVICE_URL}/`,
  headers: {
    "Content-Type": "application/json",
  },
});

adminServiceApi.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response === undefined) {
      store.dispatch(signOut());
    }
    return Promise.reject(error);
  }
);

//*ACCOUNT
export const accountServiceApi = axios.create({
  baseURL: `http://${config.ACCOUNT_SERVICE_URL}/`,
  headers: {
    "Content-Type": "application/json",
  },
});

accountServiceApi.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response === undefined) {
      store.dispatch(signOut());
    }
    return Promise.reject(error);
  }
);
