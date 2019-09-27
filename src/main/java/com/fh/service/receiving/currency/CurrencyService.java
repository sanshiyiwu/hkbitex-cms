package com.fh.service.receiving.currency;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.system.redis.RedisService;
import com.fh.util.PageData;


@Service("currencyService")
public class CurrencyService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource
	private RedisService redis;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("CurrencyMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("CurrencyMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("CurrencyMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CurrencyMapper.datalistPage", page);	
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		List<PageData> pdList = null;
		if(redis.exists("listALL")) {
			pdList = redis.getList("listALL", PageData.class);
		}else {
			pdList = (List<PageData>)dao.findForList("CurrencyMapper.listAll", pd);
			redis.setList("listALL", pdList);
		}
		return pdList;
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CurrencyMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CurrencyMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 *   通过币种获取币种余额
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findBalanceByCurrency(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CurrencyMapper.findBalanceByCurrency", pd);
	}
	
}

