package com.fh.controller.receiving.currency;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.receiving.currency.CurrencyService;
import com.fh.service.system.redis.RedisService;

/** 
 * 类名称：CurrencyController
 * 创建人：FH 
 * 创建时间：2019-09-26
 */
@Controller
@RequestMapping(value="/currency")
public class CurrencyController extends BaseController {
	
	String menuUrl = "currency/list.do"; //菜单地址(权限用)
	@Resource(name="currencyService")
	private CurrencyService currencyService;
	@Resource(name = "redisService")
	private RedisService redisService;
	
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Currency");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		BigDecimal min_number = new BigDecimal(pd.get("MIN_NUMBER").toString());
		BigDecimal max_number = new BigDecimal(pd.get("MAX_NUMBER").toString());
		pd.put("MIN_NUMBER", min_number);
		pd.put("MAX_NUMBER", max_number);
		pd.put("CURRENCY_ID", this.get32UUID());	//主键
		currencyService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Currency");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			currencyService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Currency");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		currencyService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Currency");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();	
		try{
			
			pd = this.getPageData();
			page.setPd(pd);
			//List<PageData> varList = currencyService.list(page);	//列出Currency列表
			List<PageData> varList = redisService.getList("currencyList", PageData.class);//从缓存中取得数据
			//List<PageData>	totalList = currencyService.findBalanceByCurrency(pd);//取得总和
			List<PageData>	totalList = redisService.getList("totalList", PageData.class);
			
			mv.setViewName("receiving/currency/currency_list");
			mv.addObject("varList", varList);
			mv.addObject("totalList", totalList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
			pd = redisService.get("USDT", PageData.class);//测试key
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Currency页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("receiving/currency/currency_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Currency页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = currencyService.findById(pd);	//根据ID读取
			mv.setViewName("receiving/currency/currency_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Currency");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				currencyService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 去锁仓开启页
	 * @return
	 */
	@RequestMapping(value = "/goLockOpening")
	public ModelAndView goLockOpening() {
		logBefore(logger, "去修改Currency页面--锁仓开启");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("receiving/currency/doLockOpening");
			mv.addObject("msg","LockOpening");
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 修改 锁仓开启
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lockOpening")
	public ModelAndView doLockOpening()throws Exception{
		logBefore(logger, "Currency页面--锁仓开启");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		currencyService.edit(pd);	
		mv.addObject("msg", "edit");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Currency到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("ID");	//1
			titles.add("名称");	//2
			titles.add("最少提币量");	//3
			titles.add("提币费率");	//4
			titles.add("	 合约地址");	//5
			titles.add("	 排序");	//6
			titles.add("	 基于");	//7
			titles.add("法币");	//8
			titles.add("显示");	//9
			titles.add("获取地址");	//10
			titles.add("币种logo");	//11
			titles.add("最大提币数目");	//12
			titles.add("是否杠杆币");	//13
			titles.add("是否撮合交易");	//14
			titles.add("是否显示法币商家");	//15
			titles.add("小数位数");	//16
			titles.add("币种黑名单限制数");	//17
			titles.add("总账号钱包地址");	//18
			titles.add("私钥");	//19
			titles.add("是否允许兑换");	//20
			titles.add("创建时间");	//21
			titles.add("是否锁仓");	//22
			titles.add("锁仓描述");	//23
			dataMap.put("titles", titles);
			List<PageData> varOList = currencyService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("ID").toString());	//1
				vpd.put("var2", varOList.get(i).getString("NAME"));	//2
				vpd.put("var3", varOList.get(i).get("MIN_NUMBER").toString());	//3
				vpd.put("var4", varOList.get(i).get("RATE").toString());	//4
				vpd.put("var5", varOList.get(i).getString("CONTRACT_ADDRESS"));	//5
				vpd.put("var6", varOList.get(i).get("SORT").toString());	//6
				vpd.put("var7", varOList.get(i).getString("TYPE"));	//7
				vpd.put("var8", varOList.get(i).get("IS_LEGAL").toString());	//8
				vpd.put("var9", varOList.get(i).get("IS_DISPLAY").toString());	//9
				vpd.put("var10", varOList.get(i).getString("GET_ADDRESS"));	//10
				vpd.put("var11", varOList.get(i).getString("LOGO"));	//11
				vpd.put("var12", varOList.get(i).get("MAX_NUMBER").toString());	//12
				vpd.put("var13", varOList.get(i).get("IS_LEVER").toString());	//13
				vpd.put("var14", varOList.get(i).get("IS_MATCH").toString());	//14
				vpd.put("var15", varOList.get(i).get("SHOW_LEGAL").toString());	//15
				vpd.put("var16", varOList.get(i).get("DECIMAL_SCALE").toString());	//16
				vpd.put("var17", varOList.get(i).get("BLACK_LIMT").toString());	//17
				vpd.put("var18", varOList.get(i).getString("TOTAL_ACCOUNT"));	//18
				vpd.put("var19", varOList.get(i).getString("KEY"));	//19
				vpd.put("var20", varOList.get(i).get("ALLOW_GAME_EXCHANGE").toString());	//20
				vpd.put("var21", varOList.get(i).get("CREATE_TIME").toString());	//21
				vpd.put("var22", varOList.get(i).get("IS_LOCK").toString());	//22
				vpd.put("var23", varOList.get(i).getString("LOCK_DESC"));	//23
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
