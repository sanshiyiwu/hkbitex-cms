package com.fh.service.users.real;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
/**
 * real业务逻辑层
 */
@Service("realService")
public class RealService {
	@Resource
	private DaoSupport dao;
	/**
	 * 	添加
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("RealMapper.save", pd);
	}
	/**
	 * 	删除 
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("RealMapper.delete", pd);
	}
	/**
	 * 	修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("RealMapper.edit", pd);
	}
	/**
	 * 	列表--全部a
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("RealMapper.listAll", pd);
	}
	/**
	 * 	获取列表--分页
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("RealMapper.datalistPage", page);
	}
	/**
	 * 	通过主键（id）获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RealMapper.findById", pd);
	}
	/**
	 *	 批量删除
	 * @param ArryDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("RealMapper.deleteAll", ArrayDATA_IDS);
	}
}





