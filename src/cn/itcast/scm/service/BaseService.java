package cn.itcast.scm.service;

import java.util.ArrayList;

import cn.itcast.scm.entity.Page;
//����ҵ���ӿڼ̳д˽ӿ�
public interface BaseService<T> {
	//���ʵ�������Ϣ����
	public int insert (T entity) throws Exception;
	
	//���¶���
	public int update(T entity) throws Exception;
	 
	//ɾ������
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
