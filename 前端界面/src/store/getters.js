/* 派生状态。也就是set、get中的get
 * 有两个可选参数：state、getters分别可以获取state中的变量和其他的getters*/
export const api = (state) => {
    return state.api;
}

export const userName = (state) => {
    return state.userName;
}

export const isLogin = (state) => {
    return state.isLogin;
}

