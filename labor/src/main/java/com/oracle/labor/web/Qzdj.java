package com.oracle.labor.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.jdbc.naming.GenericNamingResourcesFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.common.codetable.ComputergradeOperation;
import com.oracle.labor.common.codetable.Deformity;
import com.oracle.labor.common.codetable.EducationallevelOperation;
import com.oracle.labor.common.codetable.EmploytypeOperation;
import com.oracle.labor.common.codetable.HealthstateOperation;
import com.oracle.labor.common.codetable.IndustryOperation;
import com.oracle.labor.common.codetable.LanguageOperation;
import com.oracle.labor.common.codetable.MarriageOperation;
import com.oracle.labor.common.codetable.NationOperation;
import com.oracle.labor.common.codetable.OrgtypeOperation;
import com.oracle.labor.common.codetable.PersonneltypeOperation;
import com.oracle.labor.common.codetable.PoliticsaspectOperation;
import com.oracle.labor.common.codetable.ProficiencyOperation;
import com.oracle.labor.common.codetable.QualificationOperation;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.RegtypeOperation;
import com.oracle.labor.common.codetable.RprtypeOperation;
import com.oracle.labor.common.codetable.SexOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipSkill;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzgzb;
import com.oracle.labor.service.QzdjService;

@Controller
@RequestMapping("/qzdj")
public class Qzdj {

	@Autowired
	QzdjService service;

	@RequestMapping(value = "/form")
	public String form(Bip bip,BipForeignlanguage bfl,String[] bip_fl_jywy,String[] bip_fl_years,String[] init_wysm
			,BipSkill bs,String[] bipSZyjn,String[] bipSJsdj,String[] bipSYears
			,ZjGrqzdjb qzdj,ZjGrqzgzb qzgz,String gz[],String[] ygxs,String[] zdyx,String[] zgyx) {
		List<Bip> list=service.getAll(bip.getBipCitizenid());
	  
		if(list.size() == 0){
			bip.setBipId(GenerateID.getGenerateId());
			if (bip.getBipTCriminal() != null) {
				bip.setBipTCriminal("Y");
			} else {
				bip.setBipTCriminal("N");
			}
			if (bip.getBipTCzjyyhz() != null) {
				bip.setBipTCzjyyhz("Y");
			} else {
				bip.setBipTCzjyyhz("N");
			}
			if (bip.getBipTDestitute() != null) {
				bip.setBipTDestitute("Y");
			} else {
				bip.setBipTDestitute("N");
			}
			if (bip.getBipTLowersecurity() != null) {
				bip.setBipTLowersecurity("Y");
			} else {
				bip.setBipTLowersecurity("N");
			}
			if (bip.getBipTNewgraduate() != null) {
				bip.setBipTNewgraduate("Y");
			} else {
				bip.setBipTNewgraduate("N");
			}
			if (bip.getBipTOthercities() != null) {
				bip.setBipTOthercities("Y");
			} else {
				bip.setBipTOthercities("N");
			}
			if (bip.getBipTPeasant() != null) {
				bip.setBipTPeasant("Y");
			} else {
				bip.setBipTPeasant("N");
			}
			if (bip.getBipTRhfl() != null) {
				bip.setBipTRhfl("Y");
			} else {
				bip.setBipTRhfl("N");
			}
			if (bip.getBipTVeteran() != null) {
				bip.setBipTVeteran("Y");
			} else {
				bip.setBipTVeteran("N");
			}
			
			service.insert(bip);
		//	System.out.println("++++++++++++"+bfl.getBipFlId());
			
			//接收外语
			//System.out.println("============="+list.get(0).getBipId());
		for(int i=0;i<bip_fl_jywy.length;i++){
			System.out.println("++++++++++"+bip_fl_jywy[i]);
			System.out.println("++++++++++"+bip_fl_years[i]);
			System.out.println("++++++++++"+init_wysm[i]);
			bfl.setBipFlId(GenerateID.getGenerateId());			
			bfl.setBipId(bip.getBipId());			
			bfl.setBipFlJywy(bip_fl_jywy[i]);			
			bfl.setBipFlYears(bip_fl_years[i]);
			bfl.setBipFlWysm(init_wysm[i]);
			service.insertLanguage(bfl);		
		}
		
		
		//接收职业技能
		for(int i=0;i<bipSZyjn.length;i++){
			bs.setBipSId(GenerateID.getGenerateId());
			bs.setBipId(bip.getBipId());
			bs.setBipSZyjn(bipSZyjn[i]);
			bs.setBipSJsdj(bipSJsdj[i]);
			bs.setBipSYears(bipSYears[i]);
			service.insertSkill(bs);
		}
		
		//接收择业信息
		qzdj.setQzbh(GenerateID.getGenerateId());
		qzdj.setBipId(bip.getBipId());
		qzdj.setSfdj("否");
		if(qzdj.getSfjsdx() != null){
			qzdj.setSfjsdx("是");
		}else{
			qzdj.setSfjsdx("否");
		}
		if(qzdj.getSfcjpx() != null){
			qzdj.setSfcjpx("是");
		}else{
			qzdj.setSfcjpx("否");
		}
		if(qzdj.getSfjszyzd() != null){
			qzdj.setSfjszyzd("是");
		}else{
			qzdj.setSfjszyzd("否");
		}
		;
		
		service.insertQzdjb(qzdj);
		
		//接收择业工种
		for(int i=0;i<gz.length;i++){
		qzgz.setQzgzbh(GenerateID.getGenerateId());
		qzgz.setQzbh(qzdj.getQzbh());
		qzgz.setXh(String.valueOf(i));
		qzgz.setDjsj(new Date().toString());
		qzgz.setGz(gz[i]);
		qzgz.setYgxs(ygxs[i]);
		qzgz.setZdyx(zdyx[i]);
		qzgz.setZgyx(zgyx[i]);
		qzgz.setGdsj("暂无");
		service.insertQzgzb(qzgz);
		}
		
		
		
		
			
			return "service/zj/grqz/qzdj_1";
		}else{
			  List<ZjGrqzdjb> list1=service.getQZBH(list.get(0).getBipId());
			service.deleteLanguage(list.get(0).getBipId());
			service.deleteSkill(list.get(0).getBipId());
			if (bip.getBipTCriminal() != null) {
				bip.setBipTCriminal("Y");
			} else {
				bip.setBipTCriminal("N");
			}
			if (bip.getBipTCzjyyhz() != null) {
				bip.setBipTCzjyyhz("Y");
			} else {
				bip.setBipTCzjyyhz("N");
			}
			if (bip.getBipTDestitute() != null) {
				bip.setBipTDestitute("Y");
			} else {
				bip.setBipTDestitute("N");
			}
			if (bip.getBipTLowersecurity() != null) {
				bip.setBipTLowersecurity("Y");
			} else {
				bip.setBipTLowersecurity("N");
			}
			if (bip.getBipTNewgraduate() != null) {
				bip.setBipTNewgraduate("Y");
			} else {
				bip.setBipTNewgraduate("N");
			}
			if (bip.getBipTOthercities() != null) {
				bip.setBipTOthercities("Y");
			} else {
				bip.setBipTOthercities("N");
			}
			if (bip.getBipTPeasant() != null) {
				bip.setBipTPeasant("Y");
			} else {
				bip.setBipTPeasant("N");
			}
			if (bip.getBipTRhfl() != null) {
				bip.setBipTRhfl("Y");
			} else {
				bip.setBipTRhfl("N");
			}
			if (bip.getBipTVeteran() != null) {
				bip.setBipTVeteran("Y");
			} else {
				bip.setBipTVeteran("N");
			}
			
				service.updateBip(bip, list.get(0).getBipId());
				//	System.out.println("++++++++++++"+bfl.getBipFlId());
				
				//接收外语
				//System.out.println("============="+list.get(0).getBipId());
			for(int i=0;i<bip_fl_jywy.length;i++){
				System.out.println("++++++++++"+bip_fl_jywy[i]);
				System.out.println("++++++++++"+bip_fl_years[i]);
				System.out.println("++++++++++"+init_wysm[i]);
				bfl.setBipFlId(GenerateID.getGenerateId());			
				bfl.setBipId(list.get(0).getBipId());			
				bfl.setBipFlJywy(bip_fl_jywy[i]);			
				bfl.setBipFlYears(bip_fl_years[i]);
				bfl.setBipFlWysm(init_wysm[i]);
				service.insertLanguage(bfl);		
			}
			
			
			//接收职业技能
			for(int i=0;i<bipSZyjn.length;i++){
				bs.setBipSId(GenerateID.getGenerateId());
				bs.setBipId(list.get(0).getBipId());
				bs.setBipSZyjn(bipSZyjn[i]);
				bs.setBipSJsdj(bipSJsdj[i]);
				bs.setBipSYears(bipSYears[i]);
				service.insertSkill(bs);
			}
			
			//接收择业信息
			qzdj.setQzbh(GenerateID.getGenerateId());
			qzdj.setBipId(bip.getBipId());
			qzdj.setSfdj("否");
			if(qzdj.getSfjsdx() != null){
				qzdj.setSfjsdx("是");
			}else{
				qzdj.setSfjsdx("否");
			}
			if(qzdj.getSfcjpx() != null){
				qzdj.setSfcjpx("是");
			}else{
				qzdj.setSfcjpx("否");
			}
			if(qzdj.getSfjszyzd() != null){
				qzdj.setSfjszyzd("是");
			}else{
				qzdj.setSfjszyzd("否");
			}
			;
			
			service.insertQzdjb(qzdj);
			
			//接收择业工种
			for(int i=0;i<gz.length;i++){
			qzgz.setQzgzbh(GenerateID.getGenerateId());
			qzgz.setQzbh(qzdj.getQzbh());
			qzgz.setXh(String.valueOf(i));
			qzgz.setDjsj(new Date().toString());
			qzgz.setGz(gz[i]);
			qzgz.setYgxs(ygxs[i]);
			qzgz.setZdyx(zdyx[i]);
			qzgz.setZgyx(zgyx[i]);
			qzgz.setGdsj("暂无");
			service.insertQzgzb(qzgz);
			}
			
		
		
	
			
			return "service/zj/grqz/qzdj_1";
		}
	}
    
	@ResponseBody
	@RequestMapping(value = "/all")
	public List<Bip> all(String id) {
		List<Bip> list = service.getAll(id);
		
		System.out.println(list);
		return list;

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/allLanguage")
	public List<BipForeignlanguage> allLanguage(String id) {
		List<BipForeignlanguage> list = service.allLanguage(id);	
		for(int i=0;i<list.size();i++){
		System.out.println("bbbbbbbbbbb      "+list.get(i).getBipFlJywy());
		System.out.println("bbbbbbbbbbb       "+list.get(i).getBipFlWysm());
		System.out.println("bbbbbbbbbbb       "+list.get(i).getBipFlYears());
		}
		return list;

	}
	
	@ResponseBody
	@RequestMapping(value = "/allZYJN")
	public List<BipSkill> allZYJN(String id) {
		List<BipSkill> list = service.allZYJN(id);	
		for(int i=0;i<list.size();i++){
			System.out.println("cccccccccc      "+list.get(i).getBipSZyjn());
			System.out.println("cccccccccccc       "+list.get(i).getBipSJsdj());
			System.out.println("cccccccccc       "+list.get(i).getBipSYears());
			}
		return list;

	}
    
	@ResponseBody
	@RequestMapping(value = "/GRQZ")
	public List<ZjGrqzdjb> GRQZ(String id) {
		List<ZjGrqzdjb> list = service.QZDJ(id);	
		System.out.println(list);
		return list;

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/QZGZ")
	public List<ZjGrqzgzb> QZGZ(String id) {
		List<ZjGrqzgzb> list = service.QZGZ(id);	
		System.out.println(list);
		return list;

	}
	
	@ResponseBody
	@RequestMapping(value = "/xb", produces = "text/html;charset=UTF-8")
	public String xb(@RequestParam("id") String id) {
		System.out.println(id);
		String s = id.substring(16, 17);
		int ss = Integer.valueOf(s);
		System.out.println(ss);
		if (ss % 2 == 0) {

			return SexOperation.getOption("2");
		} else {

			return SexOperation.getOption("1");
		}

	}

	@ResponseBody
	@RequestMapping(value = "/mz", produces = "text/html;charset=UTF-8")
	public String mz(@RequestParam("value") String value) {
		return NationOperation.getOption(value);

	}

	@ResponseBody
	@RequestMapping(value = "/nl", produces = "text/html;charset=UTF-8")
	public String nl(@RequestParam("id") String id) {
		System.out.println(id);
		String s = id.substring(6, 10);
		int ss = Integer.valueOf(s);
		System.out.println(ss);
		Calendar date = Calendar.getInstance();
		String year = String.valueOf(date.get(Calendar.YEAR));
		System.out.println(year);
		int currentyear = Integer.valueOf(year);
		int age = currentyear - ss;

		return String.valueOf(age);

	}

	@ResponseBody
	@RequestMapping(value = "/zzmm", produces = "text/html;charset=UTF-8")
	public String zzmm(@RequestParam("value") String value) {
		return PoliticsaspectOperation.getOption(value);

	}

	@ResponseBody
	@RequestMapping(value = "/hyzk", produces = "text/html;charset=UTF-8")
	public String hyzk(@RequestParam("value") String value) {
		return MarriageOperation.getOption(value);

	}

	@ResponseBody
	@RequestMapping(value = "/hjxz", produces = "text/html;charset=UTF-8")
	public String hjxz(@RequestParam("value") String value) {
		return RprtypeOperation.getOption(value);

	}

	@ResponseBody
	@RequestMapping(value = "/rylb", produces = "text/html;charset=UTF-8")
	public String rylb(@RequestParam("value") String value) {
		return PersonneltypeOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/jkzk", produces = "text/html;charset=UTF-8")
	public String jkzk(@RequestParam("value") String value) {
		return HealthstateOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/cjzk", produces = "text/html;charset=UTF-8")
	public String cjzk(@RequestParam("value") String value) {
		return Deformity.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/hkszd", produces = "text/html;charset=UTF-8")
	public String hkszd(@RequestParam("value") String value) {
		return RegioncodeOperation.getProvince();
	}

	@ResponseBody
	@RequestMapping(value = "/city", produces = "text/html;charset=UTF-8")
	public String city(@RequestParam("selectedId") String selectedId, @RequestParam("region") String region) {
		return RegioncodeOperation.getSelectedRegion(selectedId, region);
	}

	@ResponseBody
	@RequestMapping(value = "/village", produces = "text/html;charset=UTF-8")
	public String village(@RequestParam("selectedId") String selectedId, @RequestParam("region") String region) {
		return RegioncodeOperation.getSelectedRegion(selectedId, region);
	}
	
	@ResponseBody
	@RequestMapping(value = "/code", produces = "text/html;charset=UTF-8")
	public String code(@RequestParam("code") String code,@RequestParam("region") String region) {
		return RegioncodeOperation.getSelectedRegion(code, region);
	}
	
	@ResponseBody
	@RequestMapping(value = "/gzdq", produces = "text/html;charset=UTF-8")
	public String gzdq(@RequestParam("id") String id) {
		return RegioncodeOperation.getNameById(id);
	}
	

	@ResponseBody
	@RequestMapping(value = "/whcd", produces = "text/html;charset=UTF-8")
	public String zyjn(@RequestParam("value") String value) {
		return EducationallevelOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/jsdj", produces = "text/html;charset=UTF-8")
	public String jsdj(@RequestParam("value") String value) {
		return QualificationOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/slcd", produces = "text/html;charset=UTF-8")
	public String slcd(@RequestParam("value") String value) {
		return ProficiencyOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/jsjdj", produces = "text/html;charset=UTF-8")
	public String jsjdj(@RequestParam("value") String value) {
		return ComputergradeOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/dwxz", produces = "text/html;charset=UTF-8")
	public String dwxz(@RequestParam("value") String value) {
		return OrgtypeOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/dwhy", produces = "text/html;charset=UTF-8")
	public String dwhy(@RequestParam("value") String value) {
		return IndustryOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/jywy", produces = "text/html;charset=UTF-8")
	public String jywy(@RequestParam("value") String value) {
		return LanguageOperation.getOption(value);
	}
	


	@ResponseBody
	@RequestMapping(value = "/jjlx", produces = "text/html;charset=UTF-8")
	public String jjlx(@RequestParam("value") String value) {
		return RegtypeOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/ygxs", produces = "text/html;charset=UTF-8")
	public String ygxs(@RequestParam("value") String value) {
		return EmploytypeOperation.getOption(value);
	}

	@ResponseBody
	@RequestMapping(value = "/gz", produces = "text/html;charset=UTF-8")
	public String gz(@RequestParam("selectedId") String selectedId,@RequestParam("gz") String gz) {
		System.out.println("---------------------"+SpecialtyOperation.getSelectedGz(selectedId, gz));
		return SpecialtyOperation.getSelectedGz(selectedId, gz);
	}
	
	@ResponseBody
	@RequestMapping(value = "/gz1", produces = "text/html;charset=UTF-8")
	public String gz1(@RequestParam("id") String id) {
		
		System.out.println("ddddddddddddddd            "+SpecialtyOperation.getNameById(id));
		return SpecialtyOperation.getNameById(id);
		
		
	}

}
