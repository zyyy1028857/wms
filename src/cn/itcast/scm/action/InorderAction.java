package cn.itcast.scm.action;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Inorder;
import cn.itcast.scm.entity.Outorder;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.InorderService;
@Controller
@RequestMapping("/inorder")
public class InorderAction extends BaseAction{

	@Resource
	private InorderService inorderService;
	
	@Resource
	private GoodsService goodsService;
	
	
	
	
	@RequestMapping("/complete")
	@ResponseBody
	public Object complete(String [] pks) throws Exception
	{   
		
		int i=0;
		String orderId=pks[0];
		System.out.println(orderId);
		Inorder inorder = inorderService.selectList2(orderId);
		Goods good = goodsService.selectByName(inorder.getGoodsName());
		int a= Integer.parseInt(inorder.getGoodsAmount());
		int b =good.getGoodsStore();
		int c =a+b;
		good.setGoodsStore(c);
		String d= "�������";
		inorder.setOrderOk(d);
		i= goodsService.update(good);
		inorderService.update(inorder);
		return i;

	}
	//���������޸Ĺ�Ӧ�̵���Ϣ
			@RequestMapping(value="/update")
			@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
			public Object update(Inorder inorder){
				System.out.println("---action.update.supplier:"+inorder);
				int i = 0;
				try {
					i = inorderService.update(inorder);
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
			i = inorderService.deleteList(pks);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@RequestMapping("/insert") //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object insert(Inorder inorder,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException{
		int i = 0;
		try {
			//inorder.setGoodsName(name);
			i = inorderService.insert(inorder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0){
			return "jinhuo.jsp";
		}else
		{
			return i;
		}
	}
	
	//ͨ���ؼ��ַ�ҳ��ѯ
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object selectPageUseDyc(Page<Inorder> page,Inorder inorder){
		
		page.setParamEntity(inorder);
		System.out.println("----page:"+page);

		Page p = inorderService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
}
