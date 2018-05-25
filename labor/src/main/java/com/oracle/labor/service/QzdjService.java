package com.oracle.labor.service;

import java.util.List;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipForeignlanguageMapper;
import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.dao.BipSkillMapper;
import com.oracle.labor.dao.ZjGrqzdjbMapper;
import com.oracle.labor.dao.ZjGrqzdjjdbMapper;
import com.oracle.labor.dao.ZjGrqzgzbMapper;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipForeignlanguageExample;
import com.oracle.labor.po.BipSkill;
import com.oracle.labor.po.BipSkillExample;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzdjbExample;
import com.oracle.labor.po.ZjGrqzgzb;
import com.oracle.labor.po.ZjGrqzgzbExample;

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
	@Autowired
	ZjGrqzgzbMapper gzbdao;
	
	@Transactional
	public void insert(Bip bip){
	
	  bipdao.insert(bip);
	}
	
	@Transactional
	public void insertLanguage(BipForeignlanguage bfl){
	
	  bfldao.insert(bfl);
	}
	
	@Transactional
	public void insertSkill(BipSkill bs){
	
	  bsdao.insert(bs);
	}
	
	@Transactional
	public void insertQzdjb(ZjGrqzdjb qzdj){
	
		qjdjbdao.insert(qzdj);
	}
	
	@Transactional
	public void insertQzgzb(ZjGrqzgzb qzgz){
	
		gzbdao.insert(qzgz);
	}
	
	
	
	public List<Bip> getAll(String id){
		BipExample example=new BipExample();
	    example.createCriteria().andBipCitizenidEqualTo(id);
		List<Bip> list=bipdao.selectByExample(example);
		return list;
	}
	
	public List<BipForeignlanguage> allLanguage(String id){
		BipForeignlanguageExample example=new BipForeignlanguageExample();
	    example.createCriteria().andBipIdEqualTo(id);
		List<BipForeignlanguage> list=bfldao.selectByExample(example);
		return list;
	}
	
	public List<BipSkill> allZYJN(String id){
		BipSkillExample example=new BipSkillExample();
	    example.createCriteria().andBipIdEqualTo(id);
		List<BipSkill> list=bsdao.selectByExample(example);
		return list;
	}
	
	public List<ZjGrqzdjb> getQZBH(String id){
		ZjGrqzdjbExample example=new ZjGrqzdjbExample();
	    example.createCriteria().andBipIdEqualTo(id);
		List<ZjGrqzdjb> list=qjdjbdao.selectByExample(example);
		return list;
	}
	
	
	public List<ZjGrqzdjb> QZDJ(String id){
		ZjGrqzdjbExample example=new ZjGrqzdjbExample();
	    example.createCriteria().andBipIdEqualTo(id).andSfdjEqualTo("否");
		List<ZjGrqzdjb> list=qjdjbdao.selectByExample(example);
		return list;
	}
	
	public List<ZjGrqzgzb> QZGZ(String id){
		ZjGrqzgzbExample example=new ZjGrqzgzbExample();
	    example.createCriteria().andQzbhEqualTo(id).andGdsjEqualTo("暂无");
		List<ZjGrqzgzb> list=gzbdao.selectByExample(example);
		System.out.println("aaaaaaaaaaaaaaaaaaaaaa"+list);
		return list;
	}
	

	public void updateBip(Bip bip,String id){
		BipExample example=new BipExample();
	    example.createCriteria().andBipIdEqualTo(id);
		bipdao.updateByExampleSelective(bip, example);
		
	}
	
	public void deleteLanguage(String id){
		BipForeignlanguageExample example=new BipForeignlanguageExample();
	    example.createCriteria().andBipIdEqualTo(id);
	    bfldao.deleteByExample(example);
		
	}
	
	public void deleteSkill(String id){
		BipSkillExample example=new BipSkillExample();
	    example.createCriteria().andBipIdEqualTo(id);
		bsdao.deleteByExample(example);
		
	}
	
	
}
