package com.oracle.labor.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.ZjDwdjjdbMapper;
import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.po.ZjDwdjjdb;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;

@Service
public class BioFreezeService {

	
	@Autowired
	ZjDwzpdjbMapper zjDwzpdjbDao;
	@Autowired
	ZjDwdjjdbMapper zjDwdjjdbDao;
	@Autowired
	ZjDwzpgzbMapper zjDwzpgzbDao;
	
	@Transactional
	public ZjDwzpdjb getZjDwzpdjById(String id) {
		
		return zjDwzpdjbDao.selectById(id);
	}
	
	@Transactional
	public Map<String,Object> getByBioNo(String bioNo) {
		return zjDwzpdjbDao.selectByBioNo(bioNo);
	}
	
	@Transactional
	public void setdwdj(String zpbh,String djyy,ZjDwzpdjb zjDwzpdjb,ZjDwzpgzb zjDwzpgzb) {
		ZjDwdjjdb zjDwdjjdb=new ZjDwdjjdb();
		zjDwdjjdb.setDwdjjdbh(GenerateID.getGenerateId());
		zjDwdjjdb.setZpbh(zpbh);
		zjDwdjjdb.setDjyy(djyy);
		zjDwdjjdbDao.insert(zjDwdjjdb);
		Date date=new Date();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
		zjDwzpdjb.setDjsj(time.format(date));
		zjDwzpgzb.setDjsj(time.format(date));
		System.out.println("===================================="+time.format(date)+":"+zjDwzpdjb.getDjsj());

		zjDwzpdjbDao.updateDj(zjDwzpdjb);
		zjDwzpgzbDao.updateDj(zjDwzpgzb);
	}
}
