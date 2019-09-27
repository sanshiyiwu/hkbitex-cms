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
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#MIN_NUMBER").val()==""){
			$("#MIN_NUMBER").tips({
				side:3,
	            msg:'请输入最少提币量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MIN_NUMBER").focus();
			return false;
		}
		if($("#RATE").val()==""){
			$("#RATE").tips({
				side:3,
	            msg:'请输入提币费率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RATE").focus();
			return false;
		}
		if($("#CONTRACT_ADDRESS").val()==""){
			$("#CONTRACT_ADDRESS").tips({
				side:3,
	            msg:'请输入	 合约地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONTRACT_ADDRESS").focus();
			return false;
		}
		if($("#SORT").val()==""){
			$("#SORT").tips({
				side:3,
	            msg:'请输入	 排序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SORT").focus();
			return false;
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入	 基于',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if($("#IS_LEGAL").val()==""){
			$("#IS_LEGAL").tips({
				side:3,
	            msg:'请输入法币',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_LEGAL").focus();
			return false;
		}
		if($("#IS_DISPLAY").val()==""){
			$("#IS_DISPLAY").tips({
				side:3,
	            msg:'请输入显示',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_DISPLAY").focus();
			return false;
		}
		if($("#GET_ADDRESS").val()==""){
			$("#GET_ADDRESS").tips({
				side:3,
	            msg:'请输入获取地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#GET_ADDRESS").focus();
			return false;
		}
	/* 	if($("#LOGO").val()==""){
			$("#LOGO").tips({
				side:3,
	            msg:'请输入币种logo',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LOGO").focus();
			return false;
		} */
		if($("#MAX_NUMBER").val()==""){
			$("#MAX_NUMBER").tips({
				side:3,
	            msg:'请输入最大提币数目',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MAX_NUMBER").focus();
			return false;
		}
		if($("#IS_LEVER").val()==""){
			$("#IS_LEVER").tips({
				side:3,
	            msg:'请输入是否杠杆币',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_LEVER").focus();
			return false;
		}
		if($("#IS_MATCH").val()==""){
			$("#IS_MATCH").tips({
				side:3,
	            msg:'请输入是否撮合交易',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_MATCH").focus();
			return false;
		}
		if($("#SHOW_LEGAL").val()==""){
			$("#SHOW_LEGAL").tips({
				side:3,
	            msg:'请输入是否显示法币商家',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SHOW_LEGAL").focus();
			return false;
		}
		if($("#DECIMAL_SCALE").val()==""){
			$("#DECIMAL_SCALE").tips({
				side:3,
	            msg:'请输入小数位数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DECIMAL_SCALE").focus();
			return false;
		}
		if($("#BLACK_LIMT").val()==""){
			$("#BLACK_LIMT").tips({
				side:3,
	            msg:'请输入币种黑名单限制数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BLACK_LIMT").focus();
			return false;
		}
		if($("#TOTAL_ACCOUNT").val()==""){
			$("#TOTAL_ACCOUNT").tips({
				side:3,
	            msg:'请输入总账号钱包地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TOTAL_ACCOUNT").focus();
			return false;
		}
		if($("#KEY").val()==""){
			$("#KEY").tips({
				side:3,
	            msg:'请输入私钥',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#KEY").focus();
			return false;
		}
		if($("#ALLOW_GAME_EXCHANGE").val()==""){
			$("#ALLOW_GAME_EXCHANGE").tips({
				side:3,
	            msg:'请输入是否允许兑换',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ALLOW_GAME_EXCHANGE").focus();
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
		if($("#IS_LOCK").val()==""){
			$("#IS_LOCK").tips({
				side:3,
	            msg:'请输入是否锁仓',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_LOCK").focus();
			return false;
		}
		if($("#LOCK_DESC").val()==""){
			$("#LOCK_DESC").tips({
				side:3,
	            msg:'请输入锁仓描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LOCK_DESC").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="currency/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CURRENCY_ID" id="CURRENCY_ID" value="${pd.CURRENCY_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<!-- <td style="width:70px;text-align: right;padding-top: 13px;">ID:</td> -->
				<td><input type="hidden" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入ID" title="ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;"></td>
				<td><h1>基础参数</h1></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">币种名称:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入名称" title="名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">	 排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入	 排序" title="	 排序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">
					<c:if test="${pd.IS_MATCH == 1}">
						<input type="checkbox" name="IS_MATCH" value="1" checked="checked" maxlength="32">撮合交易
					</c:if>
					<c:if test="${pd.IS_MATCH == 0}">
						<input type="checkbox" name="IS_MATCH" value="0" >撮合交易
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否允许兑换:</td>
				<td><input type="number" name="ALLOW_GAME_EXCHANGE" id="ALLOW_GAME_EXCHANGE" value="${pd.ALLOW_GAME_EXCHANGE}" maxlength="32" placeholder="这里输入是否允许兑换" title="是否允许兑换"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">币种logo:</td>
				<td><input type="file" name="LOGO" id="LOGO" value="${pd.LOGO}" maxlength="32" placeholder="这里输入币种logo" title="币种logo"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;"></td>
				<td><h1>提币参数</h1></td>
			</tr>
			<tr>
				
				<td style="width:70px;text-align: right;padding-top: 13px;">最少提币量:</td>
				<td><input type="text" name="MIN_NUMBER" id="MIN_NUMBER" value="${pd.MIN_NUMBER+''}" maxlength="32" placeholder="这里输入最少提币量" title="最少提币量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最大提币数目:</td>
				<td><input type="text" name="MAX_NUMBER" id="MAX_NUMBER" value="${pd.MAX_NUMBER+''}" maxlength="32" placeholder="这里输入最大提币数目" title="最大提币数目"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">提币费率:</td>
				<td><input type="text" name="RATE" id="RATE" value="${pd.RATE}" maxlength="32" placeholder="这里输入提币费率" title="提币费率"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;"></td>
				<td><h1>链上参数</h1></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">	 合约地址:</td>
				<td><input type="text" name="CONTRACT_ADDRESS" id="CONTRACT_ADDRESS" value="${pd.CONTRACT_ADDRESS}" maxlength="32" placeholder="这里输入	 合约地址" title="	 合约地址"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">	 基于:</td>
				<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入	 基于" title="	 基于"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">法币:</td>
				<td><input type="number" name="IS_LEGAL" id="IS_LEGAL" value="${pd.IS_LEGAL}" maxlength="32" placeholder="这里输入法币" title="法币"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">显示:</td>
				<td><input type="number" name="IS_DISPLAY" id="IS_DISPLAY" value="${pd.IS_DISPLAY}" maxlength="32" placeholder="这里输入显示" title="显示"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">获取地址:</td>
				<td><input type="text" name="GET_ADDRESS" id="GET_ADDRESS" value="${pd.GET_ADDRESS}" maxlength="32" placeholder="这里输入获取地址" title="获取地址"/></td>
			</tr>
			
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否杠杆币:</td>
				<td><input type="number" name="IS_LEVER" id="IS_LEVER" value="${pd.IS_LEVER}" maxlength="32" placeholder="这里输入是否杠杆币" title="是否杠杆币"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否显示法币商家:</td>
				<td><input type="number" name="SHOW_LEGAL" id="SHOW_LEGAL" value="${pd.SHOW_LEGAL}" maxlength="32" placeholder="这里输入是否显示法币商家" title="是否显示法币商家"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">小数位数:</td>
				<td><input type="number" name="DECIMAL_SCALE" id="DECIMAL_SCALE" value="${pd.DECIMAL_SCALE}" maxlength="32" placeholder="这里输入小数位数" title="小数位数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">币种黑名单限制数:</td>
				<td><input type="number" name="BLACK_LIMT" id="BLACK_LIMT" value="${pd.BLACK_LIMT}" maxlength="32" placeholder="这里输入币种黑名单限制数" title="币种黑名单限制数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">总账号钱包地址:</td>
				<td><input type="text" name="TOTAL_ACCOUNT" id="TOTAL_ACCOUNT" value="${pd.TOTAL_ACCOUNT}" maxlength="32" placeholder="这里输入总账号钱包地址" title="总账号钱包地址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">私钥:</td>
				<td><input type="password" name="KEY" id="KEY" value="${pd.KEY}" maxlength="32" placeholder="这里输入私钥" title="私钥"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否锁仓:</td>
				<td><input type="number" name="IS_LOCK" id="IS_LOCK" value="${pd.IS_LOCK}" maxlength="32" placeholder="这里输入是否锁仓" title="是否锁仓"/></td>
			</tr>
		<%-- 	<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">锁仓描述:</td>
				<td><input type="text" name="LOCK_DESC" id="LOCK_DESC" value="${pd.LOCK_DESC}" maxlength="32" placeholder="这里输入锁仓描述" title="锁仓描述"/></td>
			</tr> --%>
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