<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#ACCOUNT_NUMBER").val()==""){
			$("#ACCOUNT_NUMBER").tips({
				side:3,
	            msg:'请输入账号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ACCOUNT_NUMBER").focus();
			return false;
		}
		if($("#NATIONALITY").val()==""){
			$("#NATIONALITY").tips({
				side:3,
	            msg:'请输入国籍',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NATIONALITY").focus();
			return false;
		}
		if($("#COUNTRY_CODE").val()==""){
			$("#COUNTRY_CODE").tips({
				side:3,
	            msg:'请输入国家编码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COUNTRY_CODE").focus();
			return false;
		}
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'请输入电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			$("#EMAIL").tips({
				side:3,
	            msg:'请输入邮件',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EMAIL").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="users/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="USERS_ID" id="USERS_ID" value="${pd.USERS_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">账号:</td>
				<td><input type="text" name="ACCOUNT_NUMBER" id="ACCOUNT_NUMBER" value="${pd.ACCOUNT_NUMBER}" maxlength="32" placeholder="这里输入账号" title="账号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">国籍:</td>
				<td><input type="text" name="NATIONALITY" id="NATIONALITY" value="${pd.NATIONALITY}" maxlength="32" placeholder="这里输入国籍" title="国籍"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">国家编码:</td>
				<td><input type="text" name="COUNTRY_CODE" id="COUNTRY_CODE" value="${pd.COUNTRY_CODE}" maxlength="32" placeholder="这里输入国家编码" title="国家编码"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">电话:</td>
				<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="32" placeholder="这里输入电话" title="电话"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">邮件:</td>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="这里输入邮件" title="邮件"/></td>
			</tr>
			<tr>
				<td style="width:0;text-align: right;padding-top: 0;"></td>
				<td><input type="hidden" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入邮件" title="邮件"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>