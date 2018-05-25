package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.service.BioFreezeService;

@Controller
@RequestMapping("service/zj/dwzp")
public class BioFreezeHandler {

	@Autowired
	BioFreezeService service;
	
	
	@RequestMapping("getZjDwzpdjById")
	public ZjDwzpdjb getZjDwzpdjById(String id) {
		return service.getZjDwzpdjById(id);
	}
	
	
	
	@RequestMapping(value="/getByBioNo")
	public String getByBioNo(String bioNo,Map<String,Object> map) {
		Map<String,Object> map1=service.getByBioNo(bioNo);
		for(String s:map1.keySet()) {
			map.put(s, map1.get(s));
		}
		return "service/zj/dwzp/dwdj_dj_2";
	}
	
	@RequestMapping(value="/getBioByBioNo")
	public String getBioByBioNo(String bioNo,Map<String,Object> map) {
		Map<String,Object> map1=service.getByBioNo(bioNo);
		for(String s:map1.keySet()) {
			map.put(s, map1.get(s));
		}
		return "service/zj/dwzp/dwdj_dj_3";
	}
	
	@RequestMapping("/setDjDj")
	public String setDjDj(String zpbh,String djyy,ZjDwzpdjb zjDwzpdjb,ZjDwzpgzb zjDwzpgzb) {
		service.setdwdj(zpbh, djyy, zjDwzpdjb, zjDwzpgzb);
		return "service/zj/dwzp/dwdj_dj_1";
	}
}
