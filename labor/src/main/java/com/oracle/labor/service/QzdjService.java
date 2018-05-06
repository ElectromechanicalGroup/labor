package com.oracle.labor.service;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipForeignlanguageMapper;
import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.dao.BipSkillMapper;
import com.oracle.labor.dao.ZjGrqzdjbMapper;
import com.oracle.labor.dao.ZjGrqzdjjdbMapper;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;

@Service
public class QzdjService {

	@Autowired
	BipMapper bipdao;
	@Autowired
	BipForeignlanguageMapper bfldao;
	@Autowired
	BipSkillMapper bsdao;
	@Autowired
	ZjGrqzdjbMapper qjdjbdao;
	@Autowired
	ZjGrqzdjjdbMapper qjdjjdbdao;
	
	@Transactional
	public void insert(Bip bip){
	
	  bipdao.insert(bip);
	}
	
	
}
