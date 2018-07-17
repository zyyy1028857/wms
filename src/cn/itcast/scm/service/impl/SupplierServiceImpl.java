package cn.itcast.scm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService {

	@Override
	public List<Map<String, Object>> selectSupplier(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return supplierMapper.selectSupplier(paramMap);
	}

}
