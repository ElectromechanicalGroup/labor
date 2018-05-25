<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title></title>
<jsp:include flush="true" page="/common/alert.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script>
	$(function() {
	//	var defer = $.Deferred(); 
		$("#dwxz").load("../../../qzdj/dwxz", {
			value : "00"
		})
		$("#dwhy").load("../../../qzdj/dwhy", {
			value : "00"
		})
		$("#init_jywy").load("../../../qzdj/jywy", {
			value : "00"
		})
		$("#dwjjlx").load("../../../qzdj/jjlx", {
			value : "00"
		})
		$("#ygxs1").load("../../../qzdj/ygxs", {
			value : "00"
		})
		
		$("#init_zyjn").load("../../../qzdj/gz", {
			value : "00"
		})
		$("#init_jsdj").load("../../../qzdj/jsdj", {
							value : "00"
		})
		$("#init_wyslcd").load("../../../qzdj/slcd", {
							value : "00"
		})
		var reg = /(^\dert{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		$("#sfzhm").change(function() {
			
			if (reg.test($("#sfzhm").val())) {
				$("#xb").load("../../../qzdj/xb", {
					id : $("#sfzhm").val()
				})
				$.get("../../../qzdj/nl", {
					id : $("#sfzhm").val()
				}, function(data) {
					$("#nl").val(data);
				})

				$.get("../../../qzdj/all", {
					id : $("#sfzhm").val()
				}, function(data) {
					//alert(data[0].bipHkszd)
					if (data[0] != null) {
					
						$.get("../../../qzdj/GRQZ",{id:data[0].bipId},function(data){
							//alert(data[0].qzbh)
							$.get("../../../qzdj/QZGZ",{id:data[0].qzbh},function(data){
								//alert(data[0].gz)
							// alert(data.length)
								for(var i=0;i<data.length;i++){
//									alert(i)
									var bh=data[i].gz
									var yg=data[i].ygxs
									var zd=data[i].zdyx
									var zg=data[i].zgyx
								
									if(i==data.length-1){
										  $.ajax({url:"../../../qzdj/gz1",data:{id:bh},async:false,success:function(data){
											    $("#qzgz1").append("<option value="+bh+">"+data+"</option>")	
											    $("#ygxs1").val(yg)
											  $("#zdyx1").val(zd)
											  $("#zgyx2").val(zg)
											   $("#gztj").click()
										  }
											})
										    $("#qzgz1").val("00")
										    $("#ygxs1").val("00")
										  $("#zdyx1").val("")
										  $("#zgyx2").val("")
									}else{
										  $.ajax({url:"../../../qzdj/gz1",data:{id:bh},async:false,success:function(data){
											    $("#qzgz1").append("<option value="+bh+">"+data+"</option>")	
											    $("#ygxs1").val(yg)
											  $("#zdyx1").val(zd)
											  $("#zgyx2").val(zg)
											   $("#gztj").click()
										  }
											})
									}
									
								 }
							})
						})
						
						$.get("../../../qzdj/GRQZ",{id:data[0].bipId},function(data){
							//alert(data[0].dwxx)
							$("#dwxz").val(data[0].dwxx)
							$("#dwhy").val(data[0].dwhy)
							$("#dwjjlx").val(data[0].dwjjlx)
							$.get("../../../qzdj/gzdq",{id:data[0].gzdq},function(data){
							    //	alert(data)
							    	 $("#gzdq").append("<option value="+data[0].gzdq+">"+data+"</option>")
							})  
							if(data[0].sfjsdx == "是"){
								$(":checkbox[name=sfjsdx]").prop("checked",true);
							}
							if(data[0].sfcjpx == "是"){
								$(":checkbox[name=sfcjpx]").prop("checked",true);
							}
							if(data[0].sfjszyzd == "是"){
								$(":checkbox[name=sfjszyzd]").prop("checked",true);
							}
						})
						$.get("../../../qzdj/allLanguage",{id:data[0].bipId},function(data){
							//alert(data.length)
							
								if(data.length == 1){
								    var a1=data[0].bipFlJywy
							        var b1=data[0].bipFlYears
							        var c1=data[0].bipFlWysm
	                              $("#init_jywy").val(a1)
	                               $("#init_wyslcd").val(b1)
	                                $("#init_wysm").val(c1)
							}else{
								for(var i=0;i<data.length;i++){
						        var a=data[i].bipFlJywy
						        var b=data[i].bipFlYears
						        var c=data[i].bipFlWysm
						   //     alert(a)
						      if(i == data.length-1){
						    	
						    	  $("#init_jywy").val(a)
	                               $("#init_wyslcd").val(b)
	                                $("#init_wysm").val(c) 
		                           $("#wytj").click()		                           
						    	  $("#init_jywy").val("00")
	                               $("#init_wyslcd").val("00")
	                                $("#init_wysm").val("")
						    	
						      }else{
						    	
						    	  $("#init_jywy").val(a)
	                               $("#init_wyslcd").val(b)
	                                $("#init_wysm").val(c) 
		                           $("#wytj").click()
						      }
                         
                               
                            
							}
								
							}
						})
							$.get("../../../qzdj/allZYJN",{id:data[0].bipId},function(data){
// 								alert(11)
// 								var cc=$("#init_zyjn").load("../../../qzdj/gz1",{id:data[0].bipSZyjn})
// 								alert(cc)
								var l=data.length
								if(data.length == 1){
									   var a3=data[0].bipSZyjn
								        var b3=data[0].bipSJsdj
								        var c3=data[0].bipSYears
								     
								        $.get("../../../qzdj/gz1",{id:data[0].bipSZyjn},function(data){
										    //	alert(data)
										    	 $("#init_zyjn").append("<option value="+a3+">"+data+"</option>")
										    	  $("#init_jsdj").val(b3)
			                                     $("#init_csnx").val(c3)
			                                    
										    	//alert(data)
										    })  
								}else{
								
									for(var i=0;i<data.length;i++){
										var a2=data[i].bipSZyjn
								        var b2=data[i].bipSJsdj
								        var c2=data[i].bipSYears
								       	var d2=data[i].bipSZyjn
								           
								   // alert(11)
								    	
								        if(i==data.length-1){
								        	// alert(c2)
								        	   $.ajax({type:"get",url:"../../../qzdj/gz1",data:{id:data[i].bipSZyjn},async:false,success:function(data){
								        		 
			      								    	//alert(c2)
			      								    	 $("#init_zyjn").append("<option value="+a2+">"+data+"</option>")
			      								         $("#init_jsdj").val(b2)
			      	                                     $("#init_csnx").val(c2)
			      	                                    $("#zyjntj").click()
			      								    	//alert(data)
			      								    		$("#init_zyjn").val("00")
		                                                $("#init_jsdj").val("00")
		                                                  $("#init_csnx").val("")
								        	   }
								        	  })
		                               
		                                }else{
		                                
		                                	 $.ajax({
		                                		 type:"get",		                            	 
		                                		 url:"../../../qzdj/gz1",	                               	 
		                                		 data:{id:data[i].bipSZyjn},
		                                		 async:false,
		                                		 success:function(data){
		                                	
		      								    //	alert(data)
		      								    	 //	alert(11)
		      								    	 $("#init_zyjn").append("<option value="+a2+">"+data+"</option>")
		      								         $("#init_jsdj").val(b2)
		      	                                     $("#init_csnx").val(c2)
		      	                                    $("#zyjntj").click()
		      								    	//alert(data)
		                                	 }
		                                    })
		                                }
	                          
	                              
	                            
								}
									
								}
						})
						$("#bip_id").val(data[0].bipId)
						$("#xm").val(data[0].bipName)
						$("#bipEyesightleft").val(data[0].bipEyesightleft)
						$("#bipEyesightright").val(data[0].bipEyesightright)
						$("#bipLong").val(data[0].bipLong)
						$("#bipWeight").val(data[0].bipWeight)
						$("#sxzy").val(data[0].bipSubject)
						$("#bipBysj").val(data[0].bipBysj)
						$("#bipGraduateschool").val(data[0].bipGraduateschool)
						$("#bipConTelephone").val(data[0].bipConTelephone)
						$("#bipConMobile").val(data[0].bipConMobile)
						$("#bipConEmail").val(data[0].bipConEmail)
						$("#bipConContact").val(data[0].bipConContact)
						$("#bipConContacttel").val(data[0].bipConContacttel)
						$("#bipConPostcode").val(data[0].bipConPostcode)
						$("#bipResAddress").val(data[0].bipResAddress)
						$("#bipResume").val(data[0].bipResume)
						$("#bipQtsm").val(data[0].bipQtsm)
						$("#bipEducationallevel2").val(data[0].bipEducationallevel2)
						$("#mz").load("../../../qzdj/mz", {
							value : data[0].bipMinzu
						})
						$("#zzmm").load("../../../qzdj/zzmm", {
							value : data[0].bipZzmm
						})
						$("#hyzk").load("../../../qzdj/hyzk", {
							value : data[0].bipHyzk
						})
						$("#hjxz").load("../../../qzdj/hjxz", {
							value : data[0].bipHjxz
						})
						$("#rylb").load("../../../qzdj/rylb", {
							value : data[0].bipRylb
						})
						$("#jkzk").load("../../../qzdj/jkzk", {
							value : data[0].bipJkzk
						})
					
						$("#cjzk").load("../../../qzdj/cjzk", {
							value : data[0].bipCjqk
						})
						
						$("#whcd1").load("../../../qzdj/whcd", {
							value : data[0].bipWhcd
						})
					
						$("#jsjslcd").load("../../../qzdj/slcd", {
							value : data[0].bipPcSlcd
						})
						$("#jsjdj").load("../../../qzdj/jsjdj", {
							value : data[0].bipPcDj
						})
						
						
						if(data[0].bipTLowersecurity == "Y"){
							
							$(":checkbox[id=bipTLowersecurity]").prop("checked",true);
						}
						if(data[0].bipTNewgraduate == "Y"){
							$(":checkbox[id=bipTNewgraduate]").prop("checked",true);
						}
						if(data[0].bipTCriminal == "Y"){
							$(":checkbox[id=bipTCriminal]").prop("checked",true);
						}
						if(data[0].bipTDestitute == "Y"){
							$(":checkbox[id=bipTDestitute]").prop("checked",true);
						}
						if(data[0].bipTPeasant == "Y"){
							$(":checkbox[id=bipTPeasant]").prop("checked",true);
						}
						if(data[0].bipTVeteran == "Y"){
							$(":checkbox[id=bipTVeteran]").prop("checked",true);
						}
						if(data[0].bipTOthercities == "Y"){
							$(":checkbox[id=bipTOthercities]").prop("checked",true);
						}
						if(data[0].bipTCzjyyhz == "Y"){
							$(":checkbox[id=bipTCzjyyhz]").prop("checked",true);
						}
						if(data[0].bipTRhfl == "Y"){
							$(":checkbox[id=bipTRhfl]").prop("checked",true);
						}
						
						//省+市+区/街道 	
						var code = data[0].bipHkszd
						$("#dwszs").load("../../../qzdj/code", {
							code : code,
							region : "province"
						})
						$("#dwszq").load("../../../qzdj/code", {
							code : code,
							region : "city"
						})
						$("#dwszj").load("../../../qzdj/code", {
							code : code,
							region : "village"
						})
					} else {

						$("#mz").load("../../../qzdj/mz", {
							value : "00"
						})
						$("#zzmm").load("../../../qzdj/zzmm", {
							value : "00"
						})
						$("#hyzk").load("../../../qzdj/hyzk", {
							value : "00"
						})
						$("#hjxz").load("../../../qzdj/hjxz", {
							value : "00"
						})
						$("#rylb").load("../../../qzdj/rylb", {
							value : "00"
						})
						$("#jkzk").load("../../../qzdj/jkzk", {
							value : "00"
						})
						$("#cjzk").load("../../../qzdj/cjzk", {
							value : "00"
						})
						$("#whcd1").load("../../../qzdj/whcd", {
							value : "00"
						})
						
						$("#jsjslcd").load("../../../qzdj/slcd", {
							value : "00"
						})
						$("#jsjdj").load("../../../qzdj/jsjdj", {
							value : "00"
						})
					
						//省+市+区/街道 				
						$("#dwszs").load("../../../qzdj/hkszd", {
							value : "00"
						})
						$("#dwszs").change(function() {
							$("#dwszq").empty();
							$("#dwszj").empty();
							$.get("../../../qzdj/city", {
								code : "dwszq",
								selectedId : $("#dwszs").val(),
								region : "city"
							}, function(data) {
								$("#dwszq").html(data);
							})

						})
						$("#dwszq").change(function() {
							$.get("../../../qzdj/village", {
								code : "dwszj",
								selectedId : $("#dwszq").val(),
								region : "village"
							}, function(data) {
								$("#dwszj").html(data);
							})
						})
					}
				})

			} else {
				alert("请输入正确的身份证号")
			}
            
			
			
		})
		
		
		//职业技能 		
		$("#init_zyjn").click(function(){
			var dx,dy;
			var dx=(screen.height/2-105)+"";
   			var dy=(screen.width/2-200)+"";
			var rValue,iTem;
			rValue=window.showModalDialog("../../../common/choosegz_ModalDialog_qyc.jsp",null,"dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=210px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");		
			if(rValue != null){				
				$(this).html(rValue);
			}
				return;			
		})
		if($("#init_zyjn").val()!=""){
			$.get("qzdj_1.do",{code:"init_jsdj"},function(data){$("#init_jsdj").html(data);});		
		}
		//添加职业技能 
		$("#zyjntj").click(function(){
			if($("#init_zyjn").val()=="" ||$("#init_jsdj").val()==""||$("#init_csnx").val()==""){
				alert("该添加项必须填写完毕后，才能继续添加");
				return;
			}else{
				var reg=/^[0-9]{1,2}$/;
				
				//$!reg.test($("#init_csnx").val())
				if(!reg.test($("#init_csnx").val())){
					alert("从事年限有误 ");
					return;
				}else{
					var zyjn_text=$("#init_zyjn option:selected").text();
					var zyjn_value=$("#init_zyjn option:selected").val();
					
					var jsdj_text=$("#init_jsdj option:selected").text();
					var jsdj_value=$("#init_jsdj option:selected").val();
					
					var csnx_value=$("#init_csnx").val();
					
					var init_zyjn=$("<td width='13%' align='right'>职业技能 </td ><td width='19%'><input type='hidden' name='bipSZyjn' value='"+zyjn_value+"'><input type='text' name='init_zyjn' size='1' value='"+zyjn_text+"' readonly='readonly' style='WIDTH: 100%'></td >");			
					var init_jsdj=$("<td width='11%' align='right'>技术等级 </td ><td width='18%'><input type='hidden' name='bipSJsdj' value='"+jsdj_value+"'><input type='text' name='init_jsdj' value='"+jsdj_text+"' size='1' readonly='readonly' style='WIDTH: 100%'></td >");
					var init_csnx=$("<td width='11%' align='right'>从事年限 </td ><td width='15%'><INPUT type='text' name='bipSYears' value='"+csnx_value+"' readonly='readonly' style='WIDTH: 100%'></td >");
					var csnx=$("<td width='7%' align='center'><INPUT type='hidden' value='"+csnx_value+" style='WIDTH: 100%'></td >");
					var jnsc=$("<td width='8%' align='center'><input name='jnsc' type='button'  value='删除' class='BUTTON2' onClick='delRows(jywyTable)'></td >");
					var tr=$("<tr class='line2' align='center' ></tr >");
					var tab=$("<table id='jywyTable' width='100%'  align='center' border='0' cellpadding='0' cellspacing='1'  style='word-break:break-all;width:fixed'></table>");
					var div=$("<div></div>");
					tr.append(init_zyjn);
					tr.append(init_jsdj);
					tr.append(init_csnx);
					tr.append(csnx);
					tr.append(jnsc);			
					tab.append(tr);
					div.append(tab);			
					$("#panel_1").prepend(div);
					//一行div中的删除 
					jnsc.click(function(){
						$(this).parent().parent().parent().remove();
					})
					//清空选项 
					$("#init_zyjn").empty();					
					if($("#init_zyjn").val()!=""){
						$.get("qzdj_1.do",{code:"init_jsdj"},function(data){$("#init_jsdj").html(data);});		
					}else{
						$("#init_jsdj").empty();
					}
					$("#init_csnx").val("");
				}
			}	
		})
		//清空职业技能列表 
		$("#zyjnqc").click(function(){
			if($("#panel_1").html()==""){
				alert("未找到清除对象 ");
				return;
			}else{
				if(confirm("确认清空列表吗 ")){
					$("#panel_1").empty();	
				}
				return;
			}
			
		})
		
		
		//择业地区
		$("#gzdq").click(function(){
			var dx,dy;
			var dx=(screen.height/2-105)+"";
   			var dy=(screen.width/2-200)+"";
			var rValue,iTem;
			rValue=window.showModalDialog("../../../common/choosegzdq_ModalDialog_szd.jsp",null,"dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=210px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");		
			if(rValue != null){				
				$(this).html(rValue);
			}
				return;			
		})
		
			//外语 
		
		$("#wytj").click(function(){			
			//alert($(this).parent().parent().next());
 			if($("#init_jywy").val()=="" || $("#init_wyslcd").val()=="" || $("#init_wysm").val()==""){
 				alert("该添加项必须填写完毕后，才能继续添加");
 				return;
 			}			
			var ijwy_text=$("#init_jywy option:selected").text();
			var ijwy_value=$("#init_jywy option:selected").val();
			
			var init_wyslcd_text=$("#init_wyslcd option:selected").text();
			var init_wyslcd_value=$("#init_wyslcd option:selected").val();
			
			var init_wysm_value=$("#init_wysm").val();
			
			var init_jywy=$("<td width='13%' align='right'>具有外语 </td ><td width='19%'><input type='hidden' name='bip_fl_jywy' value='"+ijwy_value+"'><input type='text' name='init_jywy' size='1' value='"+ijwy_text+"' readonly='readonly' style='WIDTH: 100%'></td >");			
			var init_wyslcd=$("<td width='11%' align='right'>熟练程度 </td ><td width='18%'><input type='hidden' name='bip_fl_years' value='"+init_wyslcd_value+"'><input type='text' name='init_wyslcd' value='"+init_wyslcd_text+"' size='1' readonly='readonly' style='WIDTH: 100%'></td >");
			var init_wysm=$("<td width='11%' align='right'>外语说明 </td ><td width='15%'><INPUT type='text' name='init_wysm' value='"+init_wysm_value+"' readonly='readonly' style='WIDTH: 100%'></td >");
			var wytj=$("<td align='center'><INPUT type='hidden' value='"+init_wysm_value+" style='WIDTH: 100%'></td >");
			var wysc=$("<td width='8%' align='center'><input name='wysc' type='button'  value='删除' class='BUTTON2' onClick='delRows(jywyTable)'></td >");
			var tr=$("<tr class='line2' align='center' ></tr >");
			var tab=$("<table id='jywyTable' width='100%'  align='center' border='0' cellpadding='0' cellspacing='1'  style='word-break:break-all;width:fixed'></table>");
			var div=$("<div></div>");
			tr.append(init_jywy);
			tr.append(init_wyslcd);
			tr.append(init_wysm);
			tr.append(wytj);
			tr.append(wysc);			
			tab.append(tr);
			div.append(tab);			
			$("#panel_2").prepend(div);
			//一行div中的删除 
			wysc.click(function(){
				$(this).parent().parent().parent().remove();
			})
			$.get("qzdj_1.do",{code:"init_jywy"},function(data){$("#init_jywy").html(data);})						
			$("#init_jywy").change();
			$("#init_wysm").val("");
			
		})
		//外语-清空按钮 
		$("#wyqc").click(function(){
			if($("#panel_2").html()==""){
				alert("未找到清除对象 ");
				return;
			}else{
				if(confirm("确认清空列表吗 ")){
					$("#panel_2").empty();	
				}
				return;
			}
			
		})
		//择业工种 
		$(".qzgz1").click(function(){
			var dx,dy;
			var dx=(screen.height/2-105)+"";
   			var dy=(screen.width/2-200)+"";
			var rValue,iTem;
			rValue=window.showModalDialog("../../../common/choosegz_ModalDialog_qyc.jsp",null,"dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=210px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");		
			if(rValue != null){				
				$(this).html(rValue);
			}
				return;			
		})
		
		//$.get("qzdj_1.do",{code:"ygxs1"},function(data){$("#ygxs1").html(data);})		
		$("#gztj").click(function(){
			if($("#qzgz1").val()=="" ||$("#ygxs1").val()==""||$("#zdyx1").val()==""||$("#zdyx2").val()==""){
				alert("该添加项必须填写完毕后，才能继续添加");
				return;
			}else{
				var reg=/^[0-9]*$/;
				var zdyx1_value=$("#zdyx1").val();
				var zgyx2_value=$("#zgyx2").val();				
				if(!reg.test(zdyx1_value)||!reg.test(zgyx2_value)||zdyx1_value>zgyx2_value){
					alert("薪水超出范围 ");
					return;
					
				}else{
					var qzgz1_text=$("#qzgz1 option:selected").text();
					var qzgz1_value=$("#qzgz1 option:selected").val();
					
					var ygxs1_text=$("#ygxs1 option:selected").text();
					var ygxs1_value=$("#ygxs1 option:selected").val();
					
									
					var qzgz1=$("<td width='40' align='right'>工种 </td ><td width='110'><input type='hidden' name='gz' value='"+qzgz1_value+"'><input type='text' size='1' value='"+qzgz1_text+"' readonly='readonly' style='WIDTH: 100%'></td >");			
					var ygxs1=$("<td width='50' align='right'>用工形式 </td ><td width='80'><input type='hidden' name='ygxs' value='"+ygxs1_value+"'><input type='text' value='"+ygxs1_text+"' size='1' readonly='readonly' style='WIDTH: 100%'></td >");
					var zdyx=$("<td width='40' align='right'>月薪  </td ><td width='140'><INPUT type='text' name='zdyx' value='"+zdyx1_value+"' readonly='readonly' style='WIDTH: 40px'>&nbsp;至&nbsp;<INPUT type='text' name='zgyx' value='"+zgyx2_value+"' readonly='readonly' style='WIDTH: 40px'></td >");
					var gztj=$("<td width='40' align='right'><INPUT type='hidden'style='WIDTH: 100%'></td >");
					var gzsc=$("<td width='40' align='right'><input name='gzsc' type='button'  value='删除' class='BUTTON2'></td >");
					var tr=$("<tr class='line2' align='center' ></tr >");
					var tab=$("<table width='100%'  align='center' border='0' cellpadding='0' cellspacing='1'  style='word-break:break-all;width:fixed'></table>");
					var div=$("<div></div>");
					tr.append(qzgz1);
					tr.append(ygxs1);
					tr.append(zdyx);
					tr.append(gztj);
					tr.append(gzsc);			
					tab.append(tr);
					div.append(tab);			
					$("#panel_3").prepend(div);
					//一行div中的删除 
					gzsc.click(function(){
						$(this).parent().parent().parent().remove();
					})
					//清空选项 
					$("#qzgz1").empty();					
					if($("#qzgz1").val()!=""){
						$.get("qzdj_1.do",{code:"ygxs1"},function(data){$("#ygxs1").html(data);});		
					}else{
						$("#ygxs1").empty();
					}
					$("#zdyx1").val("");
					$("#zgyx2").val("");
				}
			}
			//清空列表 
			$("#gzqc").click(function(){
				if($("#panel_3").html()==""){
					alert("未找到清除对象 ");
					return;
				}else{
					if(confirm("确认清空列表吗 ")){
						$("#panel_3").empty();	
					}
					return;
				}
			
			})	
		})

		$("#baocun").click(function() {

			if($("#xb").val()==""){
				alert("性别为必添项，请选择一个！");
				$("#xb").focus();
				return;
			}
			if($("#xm").val()==""){
				alert("姓名为必添项");
				$("#xm").focus();
				return;
			}
			if($("#mz").val()==""){
				alert("民族为必添项，请选择一个！");
				$("#mz").focus();
				return;
			}
			if($("#hjxz").val()==""){
				alert("户籍性质为必添项，请选择一个！");
				$("#hjxz").focus();
				return;
			}
			if($("#rylb").val()==""){
				alert("人员类别为必添项，请选择一个！");
				$("#rylb").focus();
				return;
			}
			if($("#dwszs").val()==""&&$("#dwszq").val()==""){
				alert("户口所在地为必添项，请选择！");
				$("#dwszs").focus();
				return;
			}
			if($("#whcd1").val()==""){
				alert("文化程度为必添项，请选择一个！");
				$("#whcd1").focus();
				return;
			}
			if($("#lxdh").val()==""||$("#sj").val()==""){
				alert("固话手机必添项其一，请填写！");
				$("#lxdh").focus();
				return;
			}
			if($("#panel_1").html()==""){
				alert("职业技能为必添项");
				$("#init_zyjn").focus();
				return;
			}
			if($("#panel_3").html()==""){
				alert("择业工种为必添项");
				$("#qzgz1").focus();
				return;
			}
	
			$("#form1").submit();
		});

		

		$("#cz").click(function() {
			if (confirm("确认清空列表吗 ")) {
				$("#panel_3").empty();
			}
			return;
		})

	})
</script>
</head>
<body>
	<form name="form1" action="../../../qzdj/form" method="post" id="form1">
	<div class="MainDiv">


<div id="div1" style="display:none;position:absolute;left:0px;top:475px;background-color:white;width:250px;height:250px">
<div style="float:right;">
    <input type="button" id="_close" value="关闭"></input>
</div>
<div id="div2" style="clear:both">

</div>

</div>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="20" valign="bottom"><img
					src="<%=request.getContextPath()%>/styles/images/right/now.gif"
					width="11" height="12"> 当前位置：职业介绍 &gt; 个人求职 &gt; 求职登记</td>
			</tr>
			<tr>
				<td valign="bottom"
					background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
					height="8"><img
					src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
			</tr>
			<tr>
				<td height="20" valign="bottom">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="middle"
											background="<%=request.getContextPath()%>/styles/images/right/tagm_on_bg.gif"
											class="white" style="padding-left: 10px; padding-top: 2px">登记信息</td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_on_x.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td
											background="<%=request.getContextPath()%>/styles/images/right/tagm_off_bg.gif"
											style="padding-top: 2px">查看失业信息</td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_off_all.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
							<td><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td
											background="<%=request.getContextPath()%>/styles/images/right/tagm_off_bg.gif"
											style="padding-top: 2px"><a href="#" class="link04">查看培训信息</a></td>
										<td><img
											src="<%=request.getContextPath()%>/styles/images/right/tagr_off_end.gif"
											width="23" height="18"></td>
									</tr>
								</table></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="0" onClick="collapseCon('1');" class="titlehand">
			<tr>
				<td width="60">
					<table width="38" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
							<td width="8"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini1"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">登记信息&nbsp;&nbsp;&nbsp;提示：[个人初始登记有效期为:15天,使用修改功能可以延长有效期:12次]</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" cellpadding="0"
			style="display: block" id="c1" align="center"
			style="word-break:break-all;width:fixed">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
						<tr class="line1">
							<td width="13%" align="right"><span class="redtxt">*</span>身份证号码</td>
							<td width="20%"><INPUT id="sfzhm" name="bipCitizenid"
								style="WIDTH: 100%" value="" /></td>
							<td width="13%" align="right"><span class="redtxt">*</span>性
								别</td>
							<td width="20%"><select name="bipSex" id="xb" size="1"
								style="WIDTH: 100%" readonly></select></td>
							<td width="13%" align="right">年 龄</td>
							<td width="20%"><INPUT id="nl" name="bipAge"
								style="WIDTH: 100%" value="${Age} " readonly></td>
						</tr>
						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>姓 名</td>
							<td><INPUT id="xm" name="bipName" maxlength="32"
								style="WIDTH: 100%" value="${Name}"></td>
							<td align="right"><span class="redtxt">*</span>民 族</td>
							<td><select id="mz" name="bipMinzu" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right">政治面貌</td>
							<td><select id="zzmm" name="bipZzmm" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line1">
							<td align="right">婚姻状况</td>
							<td><select id="hyzk" name="bipHyzk" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right"><span class="redtxt">*</span>户籍性质</td>
							<td><select id="hjxz" name="bipHjxz" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right"><span class="redtxt">*</span>人员类别</td>
							<td><select id="rylb" name="bipRylb" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line2">
							<td align="right">健康状况</td>
							<td><select id="jkzk" name="bipJkzk" size="1"
								style="WIDTH: 100%"></select></td>
							<td align="right">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr class="line2" id="id1">
										<td align="right">残疾状况</td>
									</tr>
								</table>
							</td>
							<td class="line2" colspan="3">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr id="id2">
										<td><select id="cjzk" name="bipCjqk" size="1"
											style="WIDTH: 100%"></select></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="line1">
							<td align="right">视 力</td>
							<td>左<INPUT id="bipEyesightleft" name="bipEyesightleft"
								maxlength="3" style="WIDTH: 34%" value=""> 右 <INPUT
								id="bipEyesightright" name="bipEyesightright" maxlength="3"
								style="WIDTH: 34%" value="">
							</td>
							<td align="right">身 高</td>
							<td><INPUT id="bipLong" name="bipLong" maxlength="3"
								style="WIDTH: 65%" value="">(厘米)</td>
							<td align="right">体 重</td>
							<td><INPUT id="bipWeight" name="bipWeight" maxlength="3"
								style="WIDTH: 65%" value="">(公斤)</td>
						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>户口所在地</td>
							<td><select id="dwszs" name="dwszs" style="WIDTH: 100%"></select></td>
							<td align="right">市(区\县)</td>
							<td id="sqx"><select id="dwszq" name="dwszq"
								style="WIDTH: 100%"></select></td>
							<td align="right">街(镇\乡)</td>
							<td id="jzx"><select id="dwszj" name="bipHkszd"
								style="WIDTH: 100%"></select></td>
						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>文化程度</td>
							<td><select id="whcd1" name="bipWhcd" style="width: 100%"></select></td>
							<td align="right">所学专业</td>
							<td><input id="sxzy" name="bipSubject" maxlength="32"
								style="WIDTH: 100%" value=""></td>
							<td align="right">毕业时间</td>
							<td><input id="bipBysj" name="bipBysj" maxlength="32"
								style="WIDTH: 100%" value="" maxlength="8"></td>
						</tr>
						<tr class="line1">
							<td align="right">毕业学校</td>
							<td colspan="5"><input id="bipGraduateschool"
								name="bipGraduateschool" maxlength="32" style="WIDTH: 100%"
								value=""></td>

						</tr>

						<tr class="line2">
							<td align="right"><span class="redtxt">*</span>固定电话</td>
							<td><INPUT id="bipConTelephone" name="bipConTelephone"
								style="WIDTH: 100%" value="" maxlength="32"></td>
							<td width="12%" align="right"><span class="redtxt">*</span>手
								机</td>
							<td width="21%"><INPUT id="bipConMobile" name="bipConMobile"
								maxlength="11" style="WIDTH: 100%" value=""></td>
							<td align="right">E-mail</td>
							<td width="21%"><INPUT id="bipConEmail" name="bipConEmail"
								maxlength="48" style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line1">
							<td align="right">邮政编码</td>
							<td><INPUT id="bipConPostcode" name="bipConPostcode"
								maxlength="6" style="WIDTH: 100%" value=""></td>
							<td align="right">联系人</td>
							<td><INPUT id="bipConContact" name="bipConContact"
								maxlength="32" style="WIDTH: 100%" value=""></td>
							<td align="right">联系人电话</td>
							<td><INPUT id="bipConContacttel" name="bipConContacttel"
								maxlength="32" style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line2">
							<td width="13%" align="right">居住地址</td>
							<td colspan="5"><INPUT id="bipResAddress"
								name="bipResAddress" maxlength="32" style="WIDTH: 100%" value=""></td>
						</tr>
						<tr class="line1">
							<td align="right">第二学历</td>
							<td colspan="5"><textarea id="bipEducationallevel2"
									name="bipEducationallevel2" style="width: 100%"></textarea></td>
						</tr>
						<tr class="line2">
							<td width="13%" align="right">工作简历</td>
							<td class="line1" colspan="5"><textarea id="bipResume"
									name="bipResume" style="width: 100%"></textarea></td>
						</tr>
						<tr class="line1">
							<td width="13%" align="right">其他说明</td>
							<td colspan="5"><textarea id="bipQtsm" name="bipQtsm"
									style="width: 100%"></textarea></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('4');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini4"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">其它信息</td>
			</tr>
		</table>

		<TABLE width="98%" border=0 align="center" cellPadding=0 cellSpacing=1
			class="tablebody" style="display: block" id="c4">
			<tr class="line2">
				<td width="12%" align="right"><input id="bipTLowersecurity" name="bipTLowersecurity"
					type="checkbox" class="radio" value=""></td>
				<td colspan="18%">低保人员</td>
				<td width="12%" align="right"><input id="bipTDestitute" name="bipTDestitute"
					type="checkbox" class="radio" value=""></td>
				<td width="18%">特困人员</td>
				<td width="12%" align="right"><input type="checkbox"
					id="bipTNewgraduate" name="bipTNewgraduate" class="radio" value=""></td>
				<td width="26%">应届高校毕业生</td>
			</tr>
			<tr class="line1">
				<td width="12%" align="right"><input id="bipTVeteran" name="bipTVeteran"
					type="checkbox" class="radio" value=""></td>
				<td colspan="18%">复员退伍</td>
				<td width="12%" align="right"><input type="checkbox"
					id="bipTOthercities" name="bipTOthercities" class="radio" value=""></td>
				<td width="18%">外埠转入</td>
				<td width="12%" align="right"><input type="checkbox"
					id="bipTRhfl" name="bipTRhfl" class="radio" value=""></td>
				<td width="26%">是否人户分离</td>
			</tr>
			<tr class="line2">
				<td width="12%" align="right"><input id="bipTPeasant" name="bipTPeasant"
					type="checkbox" class="radio" value=""></td>
				<td colspan="18%">农转非</td>
				<td width="12%" align="right"><input type="checkbox"
					id="bipTCriminal" name="bipTCriminal" class="radio" value=""></td>
				<td width="18%">两劳释放</td>
				<td width="12%" align="right"><input type="checkbox"
					class="radio" id="bipTCzjyyhz" name="bipTCzjyyhz" value=""></td>
				<td width="26%">是否持再就业优惠证</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('5');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini5"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">具有信息</td>
			</tr>
		</table>

		<table width="98%" border="0" cellspacing="0" align="center"
			cellpadding="0" style="display: block" id="jnTable">
			<tr align="center">
				<td valign="top">
					<table id="zyjnTable" width="100%" border="0" cellpadding="0"
						cellspacing="1">
						<tr class="line1">
							<td width="13%" align="right">职业技能</td>
							<td id="o2" width="19%"><select id="init_zyjn"
								name="bipSZyjn" size="1" style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">技术等级</td>
							<td width="18%"><select id="init_jsdj" name="bipSJsdj"
								size="1" style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">从事年限</td>
							<td width="15%"><INPUT id="init_csnx" name="bipSYears"
								style="WIDTH: 100%" maxlength="2"></td>
							<td width="7%" align="center"><input id="zyjntj"
								name="zyjntj" type="button" value="添加" class="BUTTON2"></td>
							<td width="8%" align="center"><input id="zyjnqc"
								type="button" value="清空" class="BUTTON2"></td>
						</tr>
					</table>
					<div id="panel_1"></div> <!-- 外语 div+css+jQuery -->
					<table id="jywyTable" width="100%" align="center" border="0"
						cellpadding="0" cellspacing="1"
						style="word-break: break-all; width: fixed">

						<tr class="line2" align="center">
							<td width="13%" align="right">具有外语</td>
							<td width="19%"><select class="init_jywy" name='bip_fl_jywy' id="init_jywy"
								size="1" style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">熟练程度</td>
							<td width="18%"><select name='bip_fl_years' id="init_wyslcd" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">外语说明</td>
							<td width="15%"><INPUT name='init_wysm' id="init_wysm" style="WIDTH: 100%"></td>
							<td width="7%" align="center"><input id="wytj" name="wytj"
								type="button" value="添加" class="BUTTON2"></td>
							<td width="8%" align="center"><input id="wyqc" name="wyqc"
								type="button" value="清空" class="BUTTON2"></td>
						</tr>
					</table>
					<div id="panel_2"></div>
					<table width="100%" border="0" cellpadding="0" align="center"
						cellspacing="1">
						<tr class="line1" align="center">
							<td width="13%" align="right">计算机等级</td>
							<td width="19%"><select id="jsjdj" name="bipPcDj" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">熟练程度</td>
							<td width="18%"><select id="jsjslcd" name="bipPcSlcd"
								size="1" style="WIDTH: 100%"></select></td>
							<td width="10%"></td>
							<td width="15%"></td>
							<td width="7%"></td>
							<td width="8%"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('6');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini6"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">择业信息</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" align="center"
			cellpadding="0" id="c6" style="display: block">
			<tr align="center">
				<td>
					<TABLE width="100%" border=0 cellPadding=0 cellSpacing=1
						class="tablebody">
						<tr class="line1">
							<td width="13%" align="right">单位性质</td>
							<td width="22%"><select id="dwxz" name="dwxx" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="10%" align="right">单位行业</td>
							<td width="21%"><select id="dwhy" name="dwhy" size="1"
								style="WIDTH: 100%"></select></td>
							<td width="11%" align="right">经济类型</td>
							<td width="23%"><select id="dwjjlx" name="dwjjlx" size="1"
								style="WIDTH: 100%"></select></td>
						</tr>
						<tr class="line2">
							<td align="right">工作地区</td>
							<td><select id="gzdq" name="gzdq" size="1"
								style="WIDTH: 100%"></select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<tr class="line2">
							<td width="14%" align="right">是否接收短信</td>
							<td width="17%"><input name="sfjsdx" type="checkbox"
								value="" class="radio"></td>
							<td width="14%" align="right">是否参加培训</td>
							<td width="14%"><input name="sfcjpx" type="checkbox"
								value="" class="radio"></td>
							<td width="18%" align="right">是否接受职业指导</td>
							<td width="23%"><input name="sfjszyzd" type="checkbox"
								value="" class="radio"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="titlehand" onClick="collapseCon('7');">
			<tr>
				<td width="60">
					<table width="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"
								height="19"></td>
							<td width="7"><img
								src="<%=request.getContextPath()%>/styles/images/right/ico_up.gif"
								id="imgmini7"></td>
						</tr>
					</table>
				</td>
				<td valign="bottom">择业工种</td>
			</tr>
		</table>
		<table width="98%" id="c7" border=0 cellPadding=0 cellSpacing=1
			align="center" class="tablebody" style="display: block">
			<tr align="center">
				<td>
					<table id="qzgzTable" width="100%" border=0 cellPadding=0
						cellSpacing=1 class="tablebody" style="display: block">
						<tr class="line1" align="center">
							<td width="40"><span class="redtxt">*</span>工种</td>
							<td id="o1" width="110"><select class="qzgz1" id="qzgz1"
								name="gz" size="1" style="WIDTH: 100%"></select></td>
							<td width="50">用工形式</td>
							<td width="80"><select class="ygxs1" id="ygxs1" name="ygxs"
								size="1" style="WIDTH: 100%"></select></td>
							<td width="50" align="right">月薪</td>
							<td width="140">
								<div id="yx" style="display:">
									<table>
										<tr>
											<td><input id="zdyx1" name="zdyx" type="text"
												style="width: 40px" maxlength="6"> 至 <input
												id="zgyx2" name="zgyx" type="text" style="width: 40px"
												maxlength="6"> 元</td>
										</tr>
									</table>
								</div>
							</td>
							<!--  -->
							<td width="40"><input type="button" id="gztj" name="gztj"
								value="添加" class="BUTTON2"></td>
							<td width="40"><input type="button" id="gzqc" name="gzsc"
								value="清空" class="BUTTON2"></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		<table width="98%" id="c8" border=0 cellPadding=0 cellSpacing=1
			align="center" class="tablebody" style="display: block">
			<tr align="center">
				<td>
					<div id="panel_3"></div>

				</td>
			</tr>
		</table>
		<!-- <div id="panel_3"></div>	 -->
		<TABLE width="98%" border=0 cellPadding="0" cellSpacing=1
			align="center" class="tablebody">
			<tr align="center">
				<td colspan="9">&nbsp;&nbsp;
			</tr>
			<tr align="center">
				<td colspan="9" class="line2"><input type="button" id="baocun"
					class="BUTTONs3" name="bc" value="保 存"> &nbsp;&nbsp; <INPUT
					name="cz" type="reset" class="BUTTONs3" id="cz" value="取 消"
					onClick="valueReset();"> <input name="hkszd" type="hidden">
			</tr>
		</TABLE>
	</form>
</body>
</html>