package com.fh.controller.users.real;

import java.io.PrintWriter;
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
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.users.real.RealService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
/**
 * real 控制器
 * @author RLY
 *
 */
@Controller
@RequestMapping(value="/real")
public class RealController extends BaseController{
	
	String menuUrl = "real/list.do";//菜单地址栏专用
	@Resource(name = "realService")
	private RealService realService;
	/**
	 * 	添加
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Real");//日志
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {//校验权限？
			return null;
		}
		ModelAndView mv = this.getModelAndView();//获取视图
		PageData pd = new PageData();//
		pd = this.getPageData();//获取页面数据
		pd.put("REAL_ID", this.get32UUID());//产生系统32位主键（伪）
		realService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");//视图命名
		return mv;
	}
	/**
	 * 	删除
	 * @param out
	 */
	@RequestMapping(value = "delete")
	public void delete(PrintWriter out) {
		logBefore(logger, "删除Real");//日志
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {//权限校验？
			return;
		}
		PageData pd = new PageData();//
		try {
			pd = this.getPageData();//获取页面数据
			realService.delete(pd);
			out.write("success");//输出流输出信息
			out.close();//关闭流
		}catch(Exception e) {
			logger.error(e.toString(), e);//错误处理
		}	
	}
	/**
	 * 	修改
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Real");//日志
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {//权限校验
			return null;
		}
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		realService.edit(pd);//执行修改
		mv.addObject("msg","success");//添加信息
		mv.setViewName("save_result");//视图命名--返回地址
		return mv;//返回视图
	}
	/**
	 * 	获取列表--分页
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "Real列表");//日志
		//无需权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = realService.list(page);//执行查询，或得列表数据
			mv.setViewName("users/real/real_list");
			mv.addObject("varList", varList);//视图添加查询数据
			mv.addObject("pd", pd);//视图添加页面数据
			mv.addObject(Const.SESSION_QX,this.getHC());//？
		}catch(Exception e) {
			logger.error(e.toString(), e);//异常处理
		}
		return mv;
	}
	/**
	 * 	转添加页面
	 * @return
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() {
		logBefore(logger, "去新增Real页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.addObject("pd", pd);
			mv.addObject("msg", "save");
			mv.setViewName("users/real/real_edit");		
		}catch(Exception e) {
			logger.error(e.toString(), e);//异常处理
		}
		return mv;
	}
	/**
	 * 	跳转修改页面
	 * @return
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() {
		logBefore(logger, "去修改Real页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd = realService.findById(pd);//根据id获取数据
			mv.addObject("pd", pd);
			mv.setViewName("users/real/real_edit");
			mv.addObject("msg", "edit");
		}catch(Exception e) {
			logger.error(e.toString(), e);//日志
		}
		return mv;
	}
	/**
	 *	 批量删除
	 * @return
	 */
	@RequestMapping(value = "/deleteAll")
	public Object deleteAll() {
		logBefore(logger, "批量删除Real");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")) {//权限校验？
			return null;
		}
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				realService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else {
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);//
		}catch(Exception e) {//异常处理
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);//?
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Users到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("自增主键");	//1
			titles.add("用户id");	//2
			titles.add("用户姓名");	//3
			titles.add("身份证id");	//4
			titles.add("创建时间");	//5
			titles.add("认证状态");	//6
			titles.add("认证时间");	//7
			titles.add("身份证正面");//8	
			titles.add("身份证反面");//9	
			titles.add("手持身份证");//10	
			
			dataMap.put("titles", titles);
			List<PageData> varOList = realService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("ID"));	//1
				vpd.put("var2", varOList.get(i).getString("USER_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("NAME"));	//3
				vpd.put("var4", varOList.get(i).getString("CARD_ID"));	//4
				vpd.put("var5", varOList.get(i).getString("CREATE_TIME"));//5
				vpd.put("var6", varOList.get(i).getString("REVIEW_STATUS"));	//6
				vpd.put("var7", varOList.get(i).getString("REVIEW_TIME"));	//7
				vpd.put("var8", varOList.get(i).getString("FRONT_PIC"));	//8
				vpd.put("var9", varOList.get(i).getString("REVERSE_PIC"));	//9
				vpd.put("var10", varOList.get(i).getString("HAND_PIC"));//10
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
