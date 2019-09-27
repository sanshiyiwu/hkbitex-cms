package com.fh.filter;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.java_websocket.WebSocketImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.fh.plugin.websocketInstantMsg.ChatServer;
import com.fh.plugin.websocketOnline.OnlineChatServer;
import com.fh.service.receiving.currency.CurrencyService;
import com.fh.service.system.redis.RedisService;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.StringUtil;
import com.fh.util.Tools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;

/**
 * 创建人：FH 
 * 创建时间：2014年2月17日
 * @version
 */
public class startFilter extends BaseController implements Filter{
	
	 
	
	
	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		this.startWebsocketInstantMsg();
		this.startWebsocketOnline();
		this.startAddCurrencyList();
	}
	/**
	 *	启动将币种信息加入redis
	 */
	public void startAddCurrencyList() {
		//通过上下文对象获取bean对象
		ApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
		CurrencyService currencyService = (CurrencyService)applicationContext.getBean("currencyService");
		RedisService redisService = (RedisService)applicationContext.getBean("redisService");
		Page page = new Page();
		PageData pd = new PageData();
		try {
			if(!(redisService.exists("currencyList") && redisService.exists("totalList"))) {//存在即不取
				logBefore(logger, "存入缓存");
				List<PageData> pdList = (List<PageData>)currencyService.list(page);//从数据库取出数据
				List<PageData>	totalList = currencyService.findBalanceByCurrency(pd);
				redisService.setList("currencyList", pdList);//加入缓存--币种信息
				redisService.setList("totalList", totalList);//总和
				for(int i = 0;i < pdList.size(); i++)  {//加入缓存中key为currency+id 
					redisService.set(pdList.get(i).get("NAME").toString(), pdList.get(i),StringUtil.REDIS_DB);
				}
			}		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	/**
	 * 启动即时聊天服务
	 */
	public void startWebsocketInstantMsg(){
		WebSocketImpl.DEBUG = false;
		ChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置,获取端口配置
			if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
				String strIW[] = strWEBSOCKET.split(",fh,");
				if(strIW.length == 4){
					s = new ChatServer(Integer.parseInt(strIW[1]));
					s.start();
				}
			}
			//System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e ) {
			logger.error(e);
		}
	}
	
	/**
	 * 启动在线管理服务
	 */
	public void startWebsocketOnline(){
		WebSocketImpl.DEBUG = false;
		OnlineChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置,获取端口配置
			if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
				String strIW[] = strWEBSOCKET.split(",fh,");
				if(strIW.length == 4){
					s = new OnlineChatServer(Integer.parseInt(strIW[3]));
					s.start();
				}
			}
			//System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
	
	
	//计时器
	public void timer() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 9); // 控制时
		calendar.set(Calendar.MINUTE, 0); 		// 控制分
		calendar.set(Calendar.SECOND, 0); 		// 控制秒

		Date time = calendar.getTime(); 		// 得出执行任务的时间

		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				
				//PersonService personService = (PersonService)ApplicationContext.getBean("personService");

				
				//System.out.println("-------设定要指定任务--------");
			}
		}, time, 1000*60*60*24);// 这里设定将延时每天固定执行
	}


	public void destroy() {
		// TODO Auto-generated method stub
		
	}


	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
}
