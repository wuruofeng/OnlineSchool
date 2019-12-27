/*提交状态修改。也就是set、get中的set，这是vuex中唯一修改state的方式*/
import * as types from './mutation-type.js';
import state from "./state";

export default {
    [types.SET_USERNAME](state, name) {
        state.username = name;
    },
    [types.SET_LOGIN](state, login) {
        state.isLogin = login;
    },
    [types.SET_TOTALLY_WATCHING_NUM](state, num) {
        state.totally_watching_num = num;
    },
    [types.SET_TOTALLY_WATCHING_TIME](state, time) {
        state.totally_watching_time = time;
    },
    [types.SET_EXP](state, exp) {
        state.exp = exp;
    },
    [types.SET_ID](state, id) {
        state.userID = id;
    },
    [types.SET_AVATAR](state,avatar){
        state.avatar = avatar;
    },
    [types.SET_episode_title](state,title){
        state.current_episode_title = title;
    },
    [types.SET_series_title](state,title){
        state.current_series_title = title;
    },

};
