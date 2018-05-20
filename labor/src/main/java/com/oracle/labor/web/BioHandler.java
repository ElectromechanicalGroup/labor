package com.oracle.labor.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.labor.common.codetable.ComputergradeOperation;
import com.oracle.labor.common.codetable.EducationallevelOperation;
import com.oracle.labor.common.codetable.EmploytypeOperation;
import com.oracle.labor.common.codetable.HealthstateOperation;
import com.oracle.labor.common.codetable.IndustryOperation;
import com.oracle.labor.common.codetable.LanguageOperation;
import com.oracle.labor.common.codetable.MarriageOperation;
import com.oracle.labor.common.codetable.OrgtypeOperation;
import com.oracle.labor.common.codetable.PersonneltypeOperation;
import com.oracle.labor.common.codetable.ProficiencyOperation;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.RegtypeOperation;
import com.oracle.labor.common.codetable.RprtypeOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.common.codetable.ZjdgwlbOperation;
import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bio;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.service.BioService;

@Controller
@RequestMapping("/dwdj")
@SessionAttributes("bio")
public class BioHandler {
	
	@Autowired
	BioService service;
	
	@RequestMapping("/addBio1")
	public String addBio1(Bio bio) {
		service.addBio(bio);
		return "redirect:/service/zj/dwzp/dwdj_3.jsp";
	}
	
	@RequestMapping("/addBio2")
	public String addBio2(ZjDwzpdjb zjdwzpdjb,ZjDwzpgzb zjdwzpgzb,HttpSession session) {
		service.addDwzpdjb(zjdwzpdjb,zjdwzpgzb,session);
		return "redirect:/service/zj/dwzp/dwdj_2.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/getBioById")
	public Bio getBioById(String id) {
		return service.getBioById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/getOrgType",produces="text/html;charset=UTF-8")
	public String getOrgType() {
		return OrgtypeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getRegType",produces="text/html;charset=UTF-8")
	public String getRegType( ) {
		return RegtypeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getIndustry",produces="text/html;charset=UTF-8")
	public String getIndustry( ) {
		return IndustryOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getProvince",produces="text/html;charset=UTF-8")
	public String getProvince() {
		return RegioncodeOperation.getProvince();
	}
	
	@ResponseBody
	@RequestMapping(value="/getCity",produces="text/html;charset=UTF-8")
	public String getCity(String selectedId,String region) {
		return RegioncodeOperation.getSelectedRegion(selectedId,region);
	}
	
	@ResponseBody
	@RequestMapping(value="/getVillage",produces="text/html;charset=UTF-8")
	public String getVillage(String selectedId,String region) {
		return RegioncodeOperation.getSelectedRegion(selectedId,region);
	}

	@ResponseBody
	@RequestMapping(value="/getRegions",produces="text/html;charset=UTF-8")
	public String getRegions(String region,String code) {
		return RegioncodeOperation.getSelectedRegion(code,region);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getSpecialty",produces="text/html;charset=UTF-8")
	public String getSpecialty( ) {
		return SpecialtyOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getGwlb",produces="text/html;charset=UTF-8")
	public String getGwlb( ) {
		return ZjdgwlbOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getRprType",produces="text/html;charset=UTF-8")
	public String getRprType( ) {
		return RprtypeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getEduLevel",produces="text/html;charset=UTF-8")
	public String getEduLevel( ) {
		return EducationallevelOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getEmployType",produces="text/html;charset=UTF-8")
	public String getEmployType( ) {
		return EmploytypeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getMarriage",produces="text/html;charset=UTF-8")
	public String getMarriage( ) {
		return MarriageOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getHealthState",produces="text/html;charset=UTF-8")
	public String getHealthState( ) {
		return HealthstateOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getPersonnelType",produces="text/html;charset=UTF-8")
	public String getPersonnelType( ) {
		return PersonneltypeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getComputerGrade",produces="text/html;charset=UTF-8")
	public String getComputerGrade( ) {
		return ComputergradeOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getProficiency",produces="text/html;charset=UTF-8")
	public String getProficiency( ) {
		return ProficiencyOperation.getOption();
	}
	
	@ResponseBody
	@RequestMapping(value="/getLanguage",produces="text/html;charset=UTF-8")
	public String getLanguage( ) {
		return LanguageOperation.getOption();
	}
	
}
