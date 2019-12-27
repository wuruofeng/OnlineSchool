import * as types from './mutation-type.js';

export default {
    updateUserInfo({commit}, obj) {
        commit(types.SET_USERNAME, obj.username);
    }
};
