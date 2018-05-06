package com.oracle.labor.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
import com.oracle.labor.service.QzdjService;

@Controller
@RequestMapping("/qzdj")
public class Qzdj {
	
	
	
	@Autowired
	QzdjService service;
     
	
	@RequestMapping(value="/form")
	public String form(Bip bip){
	    bip.setBipId(GenerateID.getGenerateId());
	    if(bip.getBipTCriminal()!=null){
	    	bip.setBipTCriminal("Y");
	    }else{
	    	bip.setBipTCriminal("N");
	    }
	    if(bip.getBipTCzjyyhz()!=null){
	    	bip.setBipTCzjyyhz("Y");
	    }else{
	    	bip.setBipTCzjyyhz("N");
	    }
	    if(bip.getBipTDestitute()!=null){
	    	bip.setBipTDestitute("Y");
	    }else{
	    	bip.setBipTDestitute("N");
	    }
	    if(bip.getBipTLowersecurity()!=null){
	    	bip.setBipTLowersecurity("Y");
	    }else{
	    	bip.setBipTLowersecurity("N");
	    }
	    if(bip.getBipTNewgraduate()!=null){
	    	bip.setBipTNewgraduate("Y");
	    }else{
	    	bip.setBipTNewgraduate("N");
	    }
	    if(bip.getBipTOthercities()!=null){
	    	bip.setBipTOthercities("Y");
	    }else{
	    	bip.setBipTOthercities("N");
	    }
	    if(bip.getBipTPeasant()!=null){
	    	bip.setBipTPeasant("Y");
	    }else{
	    	bip.setBipTPeasant("N");
	    }
	    if(bip.getBipTRhfl()!=null){
	    	bip.setBipTRhfl("Y");
	    }else{
	    	bip.setBipTRhfl("N");
	    }
	    if(bip.getBipTVeteran()!=null){
	    	bip.setBipTVeteran("Y");
	    }else{
	    	bip.setBipTVeteran("N");
	    }
	 	service.insert(bip);
	         return "service/zj/grqz/qzdj_1";
	}
	
	
	
     
	@ResponseBody
	@RequestMapping(value="/xb",produces="text/html;charset=UTF-8")
	public String xb(@RequestParam("id") String id){
		System.out.println(id);
		String s=id.substring(16, 17);
		int ss=Integer.valueOf(s);
		System.out.println(ss);
		if(ss%2==0){
		
		return SexOperation.getOption("2");
		}else{
		
			return SexOperation.getOption("1");
		}
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/mz",produces="text/html;charset=UTF-8")
	public String mz(@RequestParam("value") String value){
		return NationOperation.getOption(value);
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/nl",produces="text/html;charset=UTF-8")
	public String nl(@RequestParam("id") String id){
		System.out.println(id);
		String s=id.substring(6, 10);
		int ss=Integer.valueOf(s);
		System.out.println(ss);
		 Calendar date = Calendar.getInstance();
	     String year = String.valueOf(date.get(Calendar.YEAR));
	     System.out.println(year);
		int currentyear=Integer.valueOf(year);
		int age=currentyear-ss;
		
		return String.valueOf(age);
		
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/zzmm",produces="text/html;charset=UTF-8")
	public String zzmm(@RequestParam("value") String value){
		return PoliticsaspectOperation.getOption(value);
	
	}
	
	@ResponseBody
	@RequestMapping(value="/hyzk",produces="text/html;charset=UTF-8")
	public String hyzk(@RequestParam("value") String value){
		return MarriageOperation.getOption(value);
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/hjxz",produces="text/html;charset=UTF-8")
	public String hjxz(@RequestParam("value") String value){
		return RprtypeOperation.getOption(value);
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/rylb",produces="text/html;charset=UTF-8")
	public String rylb(@RequestParam("value") String value){
		return PersonneltypeOperation.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/jkzk",produces="text/html;charset=UTF-8")
	public String jkzk(@RequestParam("value") String value){
		return HealthstateOperation.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/cjzk",produces="text/html;charset=UTF-8")
	public String cjzk(@RequestParam("value") String value){
		return Deformity.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/hkszd",produces="text/html;charset=UTF-8")
	public String hkszd(@RequestParam("value") String value){
		return RegioncodeOperation.getProvince();
	}
	
	@ResponseBody
	@RequestMapping(value="/city",produces="text/html;charset=UTF-8")
	public String city(@RequestParam("selectedId") String selectedId,@RequestParam("region") String region){
		return RegioncodeOperation.getSelectedRegion(selectedId, region);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/village",produces="text/html;charset=UTF-8")
	public String village(@RequestParam("selectedId") String selectedId,@RequestParam("region") String region){
		return RegioncodeOperation.getSelectedRegion(selectedId, region);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/whcd",produces="text/html;charset=UTF-8")
	public String zyjn(@RequestParam("value") String value){
		return EducationallevelOperation.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/jsdj",produces="text/html;charset=UTF-8")
	public String jsdj(@RequestParam("value") String value){
		return QualificationOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/slcd",produces="text/html;charset=UTF-8")
	public String slcd(@RequestParam("value") String value){
		return ProficiencyOperation.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/jsjdj",produces="text/html;charset=UTF-8")
	public String jsjdj(@RequestParam("value") String value){
		return ComputergradeOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/dwxz",produces="text/html;charset=UTF-8")
	public String dwxz(@RequestParam("value") String value){
		return OrgtypeOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/dwhy",produces="text/html;charset=UTF-8")
	public String dwhy(@RequestParam("value") String value){
		return IndustryOperation.getOption(value);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/jywy",produces="text/html;charset=UTF-8")
	public String jywy(@RequestParam("value") String value){
		return LanguageOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/jjlx",produces="text/html;charset=UTF-8")
	public String jjlx(@RequestParam("value") String value){
		return RegtypeOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/ygxs",produces="text/html;charset=UTF-8")
	public String ygxs(@RequestParam("value") String value){
		return EmploytypeOperation.getOption(value);
	}
	
	@ResponseBody
	@RequestMapping(value="/gz",produces="text/html;charset=UTF-8")
	public String gz(@RequestParam("value") String value){
		return SpecialtyOperation.getOption(value);
	}
	
}
