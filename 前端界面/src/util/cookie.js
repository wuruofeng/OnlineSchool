//获取cookie
export function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)")

	if(arr = document.cookie.match(reg)) {
		return arr[2];
	}else {
		return null;
	}
}

//设置cookie
export function setCookie(c_name, value, expiredays) {
	const exdate = new Date();
	expiredays =  (expiredays || 1) * 24 * 60 * 60 * 1000;
	exdate.setDate(exdate.getDate() + expiredays);
	document.cookie = c_name + '=' + escape(value) + ((expiredays == null) ? "": ';expires='+exdate.toGMTString())
}

//删除cookie
export function delCookie (name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 2);
	var cval = getCookie(name);
	if (cval != null)
	  document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

//导入请复制
// import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
