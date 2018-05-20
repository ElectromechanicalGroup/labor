package com.oracle.labor.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.BioMapper;
import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.po.Bio;
import com.oracle.labor.po.BioExample;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;

@Service
@SessionAttributes(types=Bio.class)
public class BioService {

	@Autowired
	BioMapper bioDao;

	@Autowired
	ZjDwzpdjbMapper zjdwzpdjbDao;

	@Autowired
	ZjDwzpgzbMapper zjdwzpgzbDao;

	@Transactional
	public void addBio(Bio bio) {

		if (bioDao.selectByNo(bio.getBioNo()) != null) {
			BioExample example = new BioExample();
			example.createCriteria().andBioNoEqualTo(bio.getBioNo());

			bioDao.updateByExample(bio, example);
		} else {
			bio.setBioId(GenerateID.getGenerateId());
			bioDao.insert(bio);
		}
	}

	@Transactional
	public void addDwzpdjb(ZjDwzpdjb zjdwzpdjb, ZjDwzpgzb zjdwzpgzb, HttpSession session) {

		Bio bio=(Bio) session.getAttribute("bio");
		System.out.println("=======================================================");
		System.out.println(bio);
		zjdwzpdjb.setDwbh(bio.getBioId());
		zjdwzpdjb.setZpbh(GenerateID.getGenerateId());
		zjdwzpgzb.setZpbh(zjdwzpdjb.getZpbh());
		zjdwzpgzb.setZrs(zjdwzpgzb.getZprsn() + zjdwzpgzb.getZprsnv() + zjdwzpgzb.getXbbx());
		Date date = new Date();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
		zjdwzpgzb.setDjsj(time.format(date));
		zjdwzpdjb.setDjsj(time.format(date));
		zjdwzpdjbDao.insert(zjdwzpdjb);
		zjdwzpgzb.setZpgzbh(GenerateID.getGenerateId());
		zjdwzpgzbDao.insert(zjdwzpgzb);

	}

	@Transactional
	public Bio getBioById(String id) {

		return bioDao.selectByNo(id);
	}
}
