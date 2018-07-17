package cn.itcast.scm.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.SupplierService;

@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {
	@Resource
	private GoodsService goodsService;	
	
	@RequestMapping("/deleteList")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object deleteList(String [] pks){
		System.out.println("---doAjax.deleteList:"+pks);
		int i = 0;
		try {
			i = goodsService.deleteList(pks);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	//���������޸Ĺ�Ӧ�̵���Ϣ
		@RequestMapping(value="/update")
		@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
		public Object update(Goods goods){
			System.out.println("---action.update.supplier:"+goods);
			int i = 0;
			try {
				i = goodsService.update(goods);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return i;
		}
	
	
	
	@RequestMapping(value="/insert")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object insert(Goods goods){
		System.out.println("---action.supplier:"+goods);
		int i = 0;
		try {
			i = goodsService.insert(goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	
	
	
	
	//ͨ���ؼ��ַ�ҳ��ѯ
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object selectPageUseDyc(Page<Goods> page,Goods goods){
		
		page.setParamEntity(goods);
		System.out.println("----page:"+page);

		Page p = goodsService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
	
	
}
