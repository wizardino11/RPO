import axios from "axios";
import Utils from "../utils/Utils";
import {config} from "@fortawesome/fontawesome-svg-core";
import {store, alertActions} from "../utils/Rdx";
const API_URL = 'http://localhost:8081/api/v1'
const AUTH_URL = 'http://localhost:8081/auth'
// Компонент, который осуществляется авторизацию и лог-аут пользователя через GUI
class BackendService {
    login(login, password) {
        return axios.post(`${AUTH_URL}/login`, {login, password})
    }
    logout() {
        return axios.get(`${AUTH_URL}/logout`, { headers : {Authorization : Utils.getToken()}})
    }

    retrieveAllCountries(page, limit) {
        return axios.get(`${API_URL}/countries`, { headers : {Authorization : Utils.getToken()}});
    }
    retrieveCountry(id) {
        return axios.get(`${API_URL}/countries/${id}`, { headers : {Authorization : Utils.getToken()}});
    }
    createCountry(country) {
        return axios.post(`${API_URL}/countries`, country, { headers : {Authorization : Utils.getToken()}});
    }
    updateCountry(country) {
        return axios.put(`${API_URL}/countries/${country.id}`, country, { headers : {Authorization : Utils.getToken()}});
    }
    deleteCountries(countries) {
        return axios.post(`${API_URL}/deletecountries`, countries, { headers : {Authorization : Utils.getToken()}});
    }
}

function showError(msg) {
    store.dispatch(alertActions.error(msg))
}
axios.interceptors.request.use(
    config => {
        store.dispatch(alertActions.clear())
        // Эти строчки приводят к тому, что user null

        // let token = Utils.getToken();
        // if (token)
        //    config.headers.Authorization = token;
        return config;
    },
    error => {
        showError(error.message)
        return Promise.reject(error);
    })

// Здесь вскрылась ещё одна беда:
// при получении ошибки не выводится её название, а пишется стандартное сообщение
// хотя на стороне бэкенда класс написан корректно и путём отладки было установлено, что в 500 ошибку
// записывается данное сообщение. Но на стороне фронтенда мы её не получаем. При чём выполняется только последнее условие
axios.interceptors.response.use(undefined,
    error => {
        if (error.response && error.response.status && [401, 403].indexOf(error.response.status) !== -1) {
            showError("Ошибка авторизации 401/403")
        } else if (error.response && error.response.data && error.response.data.message) {
            showError(error.response.data.message)
        } else {
            showError(error.message)
        }
        return Promise.reject(error);
    })
export default new BackendService()