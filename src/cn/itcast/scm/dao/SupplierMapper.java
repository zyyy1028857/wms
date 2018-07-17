package cn.itcast.scm.dao;

import java.util.List;
import java.util.Map;

import cn.itcast.scm.entity.Supplier;

public interface SupplierMapper extends BaseMapper<Supplier> {
   //public int insertSupplier(Supplier supplier);
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}