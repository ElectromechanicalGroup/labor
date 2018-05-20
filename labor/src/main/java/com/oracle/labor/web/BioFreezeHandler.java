package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.po.ZjDwzpdjb;
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
	
	
	@ResponseBody
	@RequestMapping(value="/getByBioNo")
	public Map getByBioNo(String bioNo) {
		
		return service.getByBioNo(bioNo);
	}
	
}
