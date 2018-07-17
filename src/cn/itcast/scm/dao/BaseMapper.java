package cn.itcast.scm.dao;

import java.util.ArrayList;
import java.util.List;

import cn.itcast.scm.entity.Page;
//基础Mapper  其他的Mapper接口继承此接口
public interface BaseMapper<T> {
	//添加实体对象信息到表
	public int insert(T entity);
	
	//根据对象主键查询
	public int update(T entity);
	
	//根据主键删除对象
	public int delete(T entity);
	
	//
	public int deleteList(String [] pks);
	
    //	完成仓库出入订单所使用到根据orderId返回一个order的详细信息
	public T selectList2(String  orderId);
	//
	
//	根据名字查询一个东西
	public T selectByName(String name);
	
	public T select(T entity);
	
	//
	public List<T> selectPageList(Page<T> page);
	
	//
	public Integer selectPageCount(Page<T> page);
	
	//
	public List<T> selectPageListUseDyc(Page<T> page);
		
		//
	public Integer selectPageCountUseDyc(Page<T> page);
	
	
	

}
