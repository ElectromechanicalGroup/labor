<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/import.jsp"%>
<html>
<head>
<title>工种选择</title>
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#gw").change(function() {

			$("#gz1").empty();
			$("#gz2").empty();
			$("#gz3").empty();
			$.get("../qzdj/gz", {
				code : "gw",
				selectedId : $("#gw").val(),
				gz : "gz1"
			}, function(data) {
				$("#gz1").html(data);
			})

		})
		$("#gz1").change(function() {
			$.get("../qzdj/gz", {
				code : "gz2",
				selectedId : $("#gz1").val(),
				gz : "gz2"
			}, function(data) {
				$("#gz2").html(data);
			})
		})
		$("#gz2").change(function() {
			$.get("../qzdj/gz", {
				code : "gz3",
				selectedId : $("#gz2").val(),
				gz : "gz3"
			}, function(data) {				
				$("#gz3").html(data);		
				$("#gz3").change();
			})			
		})
		
		$("#gz3").change(function(){
			$("#gzdm").val($("#gz3 option:selected").val());
			$("#gzmc").val($("#gz3 option:selected").text());
		})
		
	})
</script>
<script>
	function doSubmit() {
		if (form1.gw.value == "") {
			alert("岗位一项为必选项!");
			return;
		}
		if (form1.gz1.value == "") {
			alert("下属工种1一项为必选项!");
			return;
		}
		if (form1.gz2.value == "") {
			alert("下属工种2一项为必选项!");
			return;
		}
		if (form1.gz3.length > 1 && form1.gz3.value == "") {
			alert("请确认细类一项的选择内容!")
			return;
		}
		var selectedValue;
		var selectedText
		if (form1.gz3.value == "") {
			selectedValue = "\""
					+ form1.gz2.options[form1.gz2.selectedIndex].value + "\"";
			selectedText = form1.gz2.options[form1.gz2.selectedIndex].text;
		} else {
			selectedValue = "\""
					+ form1.gz3.options[form1.gz3.selectedIndex].value + "\"";
			selectedText = form1.gz3.options[form1.gz3.selectedIndex].text;
		}
		window.returnValue = "<option></option><option selected value="+selectedValue+">"
				+ selectedText + "</option>";
		window.close();
	}
	function escQuit() {
		if (event.keyCode == 27) {
			window.close();
		}
	}
</script>
</head>
<body leftmargin="0" topmargin="0" onkeypress="escQuit();">
	<form name="form1" style="">
		<table border="0" cellpadding="0" cellspacing="0" align="center"
			width="100%">
			<tr class="line4">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="line1">
				<td align="right">大&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td id="gwtd"><select id="gw" style="width: 120px"
					onchange="initGz1()">
						<%=SpecialtyOperation.getGwmc()%>
				</select></td>
				<td align="right">中&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td width="33%" id="gz1td"><select id="gz1"
					style="width: 120px">

				</select></td>
			</tr>
			<tr class="line2">
				<td align="right">小&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td id="gz2td"><select name="gz2" id="gz2" style="width: 120px">

				</select></td>
				<td align="right">细&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td id="gz3td"><select name="gz3" id="gz3" style="width: 120px"
					onchange="updateSelect4(this,form1.slt4)">

				</select></td>
			</tr>
			<tr class="line2">
				<td align="right">工种代码</td>
				<td><input type=text name="gzdm" id="gzdm" value="" readonly
					style="width: 10em" maxlength="7"></td>
				<td align="right">工种名称</td>
				<td><input type="text" name="gzmc" id="gzmc" value=""
					readonly style="width: 10em"></td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			align="center">
			<tr class="line2">
				<td align="center">&nbsp;</td>
			</tr>
			<tr class="line2">
				<td align="center"><input type="button" name="qued"
					value="确&nbsp;定" class="BUTTONs3" onclick="doSubmit()"
					style="cursor: hands"></td>
			</tr>
		</table>
	</form>
</body>
</html>
