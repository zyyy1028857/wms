package cn.itcast.scm.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.BaseMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.dao.InorderMapper;
import cn.itcast.scm.dao.OutorderMapper;
import cn.itcast.scm.dao.SupplierMapper;
import cn.itcast.scm.dao.SysParamMapper;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {
	protected  BaseMapper<T> baseMapper;
	
	@Autowired
	protected  SupplierMapper supplierMapper;
	
	@Autowired
	protected  AccountMapper accountMapper;
	
	@Autowired
	protected  GoodsMapper goodsMapper;
	
	@Autowired
	protected  InorderMapper inorderMapper;
	
	@Autowired
	protected  OutorderMapper outorderMapper;
	
	@Autowired
	protected  SysParamMapper sysParamMapper;
	
	@PostConstruct//�ڹ��췽���󣬳���ǰִ��
	private void initBaseMapper() throws Exception{
		//��������߼�����Ҫ���з��������������ʹ�ù淶
				//this�ؼ���ָ����������ָ���ǵ��ô˷�����ʵ���ࣨ���ࣩ
				ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
				//��ȡ��һ��������class
				Class clazz = (Class)type.getActualTypeArguments()[0];
				//ת��Ϊ����������ص�Mapper�������������Supplier  supplierMapper
				String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
				//getDeclaredField:����ʹ���ڰ���˽�С�Ĭ�ϡ��ܱ����������ֶΣ����������̳е��ֶ�
				Field field=this.getClass().getSuperclass().getDeclaredField(localField);
				
				Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
				
				
				//field.get(this)��ȡ��ǰthis��field�ֶε�ֵ�����磺Supplier�����У�baseMapper��ָ��Ķ���Ϊ��������SupplierMapper���������Ͷ����ѱ�springʵ������������		
				baseField.set(this, field.get(this));		
				

	}	
	

	@Override
	public int insert(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.insert(entity);
	}

	@Override
	public int update(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.update(entity);
	}

	@Override
	public int delete(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.delete(entity);
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.deleteList(pks);
	}

	@Override
	public T select(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.select(entity);
	}

	@Override
	public Page<T> selectPage(Page<T> page) {
		page.setList(baseMapper.selectPageList(page));
		page.setTotalRecord(baseMapper.selectPageCount(page));
		return page;
	}

	@Override
	public Page<T> selectPageUseDyc(Page<T> page) {
		// TODO Auto-generated method stub
		page.setList(baseMapper.selectPageListUseDyc(page));
		page.setTotalRecord(baseMapper.selectPageCountUseDyc(page));
		return page;
	}


	@Override
	public T selectList2(String  orderId) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.selectList2(orderId);
	}


	@Override
	public T selectByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.selectByName(name);
	}

}
