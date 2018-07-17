package cn.itcast.scm.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierAction extends BaseAction {
	@Resource
	private SupplierService supplierService;
	
	@RequestMapping("/selectSupplier")
	@ResponseBody
	public Object selectSupplier(String start,String end){
		System.out.println("start:"+ start+"||end:"+end);
		Map<String, String> paramMap =new HashMap<String, String>();
		paramMap.put("start", start);
		paramMap.put("end", end);

		return supplierService.selectSupplier(paramMap);
	}
	
	
	
	@RequestMapping(value="/insert")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object insert(Supplier supplier){
		System.out.println("---action.supplier:"+supplier);
		int i = 0;
		try {
			i = supplierService.insert(supplier);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//���������޸Ĺ�Ӧ�̵���Ϣ
	@RequestMapping(value="/update")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object update(Supplier supplier){
		System.out.println("---action.update.supplier:"+supplier);
		int i = 0;
		try {
			i = supplierService.update(supplier);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	@RequestMapping("/deleteList")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object deleteList(String [] pks){
		System.out.println("---doAjax.deleteList:"+pks);
		int i = 0;
		try {
			i = supplierService.deleteList(pks);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	
	//ͨ���ؼ��ַ�ҳ��ѯ
	@RequestMapping("/selectPage")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object selectPage(Page<Supplier> page){
		
		
		Page p = supplierService.selectPage(page);
		System.out.println("----page:"+page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return page.getPageMap();
	}
	
	//ͨ���ؼ��ַ�ҳ��ѯ
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object selectPageUseDyc(Page<Supplier> page,Supplier supplier){
		
		page.setParamEntity(supplier);
		System.out.println("----page:"+page);

		Page p = supplierService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
	
	//ͨ���ؼ��ַ�ҳ��ѯ
/*	@RequestMapping("/selectPage")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object selectPage(Page<Supplier> page,HttpServletRequest request){
		String pageIndex=request.getParameter("page");
		String pageSize =  request.getParameter("rows");
		String keyWord =  request.getParameter("keyWord");
		System.out.println("---doAjax.page||rows||keyWord:"+pageIndex+","+pageSize+","+keyWord);

		Page<Supplier> page = new Page<Supplier>();
		page.setPageIndex(Integer.parseInt(pageIndex));
		page.setPageSize(Integer.parseInt(pageSize));
		page.setKeyWord(keyWord);
		Page p = supplierService.selectPage(page);
		System.out.println("----page:"+page);
		//supplier.setSupName("supName1");
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",page.getTotalRecord());
		map.put("rows",page.getList());
		return map;
	}*/
	
	/*@RequestMapping(value="/supplierlist")
	public String list(){
		System.out.println("---action.list:");
	
		return "forward:/WEB-INF/supplier/supplierlist.jsp";
	}*/
	
	@RequestMapping("/doAjax")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}


}
