package cn.itcast.scm.service;

import java.util.ArrayList;

import cn.itcast.scm.entity.Page;
//其它业务层接口继承此接口
public interface BaseService<T> {
	//添加实体对象信息到表
	public int insert (T entity) throws Exception;
	
	//更新对象
	public int update(T entity) throws Exception;
	 
	//删除对象
	public int delete(T entity) throws Exception;
	
	//
	public T selectByName(String name) throws Exception;
	
	public int deleteList(String [] pks) throws Exception;

	public T selectList2(String  orderId) throws Exception;
	//
	public T select(T entity);
	
	//
	public Page<T> selectPage(Page<T> page); 
	
	
	//
	public Page<T> selectPageUseDyc(Page<T> page); 
}
