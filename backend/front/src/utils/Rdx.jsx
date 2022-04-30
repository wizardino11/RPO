// Набор действий
import Utils from "./Utils";
import {applyMiddleware, combineReducers, createStore} from "redux";
import {createLogger} from "redux-logger"

const userConstants = {
    LOGIN: 'USER_LOGIN',
    LOGOUT: 'USER_LOGOUT'
};

export const userActions = {
    login,
    logout
};

function login(user) {
    Utils.saveUser(user);
    return {type: userConstants.LOGIN, user}
}

function logout() {
    Utils.removeUser();
    return {type: userConstants.LOGOUT}
}

let user = Utils.getUser()
const initialState = user ? {user} : {}

function authentication(state = initialState, action) {
    console.log("authentication")
    // Всё это нужно так как при каждом запуске хранилище сбрасывается
    switch(action.type) {
        case userConstants.LOGIN:
            return {user: action.user};
        case userConstants.LOGOUT:
            return {};
        default:
            return state
    }
}

function error(msg) {
    return {type: alertConstants.ERROR, msg}
}

function clear() {
    return {type: alertConstants.CLEAR}
}

function alert(state = {}, action) {
    console.log("ALERT")
    switch(action.type) {
        case alertConstants.ERROR:
            return {msg: action.msg};
        case alertConstants.CLEAR:
            return {};
        default:
            return state
    }
}

const alertConstants = {
    ERROR: 'ERROR',
    CLEAR: 'CLEAR',
};

const rootReducer = combineReducers({
    authentication, alert
});

const loggerMiddleware = createLogger();

export const store = createStore(rootReducer, applyMiddleware(loggerMiddleware));
export const alertActions = {
    error,
    clear
};