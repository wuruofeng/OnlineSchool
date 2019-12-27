package org.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

public class Action {
	
	protected <T> JSONObject getJSONObject(int total, List<T> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return JSONObject.fromObject(map);
	}

	protected JSONObject fail() {
		  HashMap<String,Object> map= new HashMap<String,Object>();
		 map.put("success", false);
		 map.put("msg", "操作失败");
		 return JSONObject.fromObject(map);
	}

	protected JSONObject success() {
		HashMap<String,Object> map= new HashMap<String,Object>();
		 map.put("success", true);
		 map.put("msg", "操作成功");
		 return JSONObject.fromObject(map);
	}

	protected HashMap<String, Integer> getMap(int page,int rows) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginIndex", (page - 1) * rows);
		map.put("rows", rows);
		return map;
	}
	
}