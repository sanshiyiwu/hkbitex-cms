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
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入用户id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入用户姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#CARD_ID").val()==""){
			$("#CARD_ID").tips({
				side:3,
	            msg:'请输入身份证id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CARD_ID").focus();
			return false;
		}
		if($("#CREATE_TIME").val()==""){
			$("#CREATE_TIME").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_TIME").focus();
			return false;
		}
		if($("#REVIEW_STATUS").val()==""){
			$("#REVIEW_STATUS").tips({
				side:3,
	            msg:'请输入认证状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REVIEW_STATUS").focus();
			return false;
		}
		if($("#REVIEW_TIME").val()==""){
			$("#REVIEW_TIME").tips({
				side:3,
	            msg:'请输入认证时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REVIEW_TIME").focus();
			return false;
		}
		if($("#FRONT_PIC").val()==""){
			$("#FRONT_PIC").tips({
				side:3,
	            msg:'请输入身份证正面',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FRONT_PIC").focus();
			return false;
		}
		if($("#REVERSE_PIC").val()==""){
			$("#REVERSE_PIC").tips({
				side:3,
	            msg:'请输入身份证反面',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REVERSE_PIC").focus();
			return false;
		}
		if($("#HAND_PIC").val()==""){
			$("#HAND_PIC").tips({
				side:3,
	            msg:'请输入手持身份证',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HAND_PIC").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="real/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="REAL_ID" id="REAL_ID" value="${pd.REAL_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">自增主键:</td>
				<td><input type="hidden" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入自增主键" title="自增主键"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用户id:</td>
				<td><input type="number" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入用户id" title="用户id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用户姓名:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入用户姓名" title="用户姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">身份证id:</td>
				<td><input type="text" name="CARD_ID" id="CARD_ID" value="${pd.CARD_ID}" maxlength="32" placeholder="这里输入身份证id" title="身份证id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input class="span10 date-picker" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">认证状态:</td>
				<td><input type="number" name="REVIEW_STATUS" id="REVIEW_STATUS" value="${pd.REVIEW_STATUS}" maxlength="32" placeholder="这里输入认证状态" title="认证状态"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">认证时间:</td>
				<td><input class="span10 date-picker" name="REVIEW_TIME" id="REVIEW_TIME" value="${pd.REVIEW_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="认证时间" title="认证时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">身份证正面:</td>
				<td><input type="text" name="FRONT_PIC" id="FRONT_PIC" value="${pd.FRONT_PIC}" maxlength="32" placeholder="这里输入身份证正面" title="身份证正面"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">身份证反面:</td>
				<td><input type="text" name="REVERSE_PIC" id="REVERSE_PIC" value="${pd.REVERSE_PIC}" maxlength="32" placeholder="这里输入身份证反面" title="身份证反面"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">手持身份证:</td>
				<td><input type="text" name="HAND_PIC" id="HAND_PIC" value="${pd.HAND_PIC}" maxlength="32" placeholder="这里输入手持身份证" title="手持身份证"/></td>
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