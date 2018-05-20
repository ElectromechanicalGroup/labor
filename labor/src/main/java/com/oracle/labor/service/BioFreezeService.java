package com.oracle.labor.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.po.ZjDwzpdjb;

@Service
public class BioFreezeService {

	
	@Autowired
	ZjDwzpdjbMapper zjDwzpdjbDao;
	
	@Transactional
	public ZjDwzpdjb getZjDwzpdjById(String id) {
		
		return zjDwzpdjbDao.selectById(id);
	}
	
	@Transactional
	public Map getByBioNo(String bioNo) {
		return zjDwzpdjbDao.selectByBioNo(bioNo);
	}
}
