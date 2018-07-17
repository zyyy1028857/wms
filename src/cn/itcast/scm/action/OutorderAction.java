package cn.itcast.scm.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Outorder;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.OutorderService;
@Controller
@RequestMapping("/outorder")
public class OutorderAction extends BaseAction{

	@Resource
	private OutorderService outorderService;
	
	@Resource
	private GoodsService goodsService;
	
	
	
	@RequestMapping("/complete")
	@ResponseBody
	public Object complete(String [] pks) throws Exception
	{   
		
		int i=0;
		String orderId=pks[0];
		System.out.println(orderId);
		Outorder outorder = outorderService.selectList2(orderId);
		System.out.println(outorder);
		Goods good = goodsService.selectByName(outorder.getGoodsName());
		int a= Integer.parseInt(outorder.getGoodsAmount());
		int b =good.getGoodsStore();
		int c =b-a;
		good.setGoodsStore(c);
		String d= "出库完成";
		outorder.setOrderOk(d);
		i= goodsService.update(good);
		outorderService.update(outorder);
		return i;

	}

	//根据主键修改供应商的信息
			@RequestMapping(value="/update")
			@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
			public Object update(Outorder inorder){
				System.out.println("---action.update.supplier:"+inorder);
				int i = 0;
				try {
					i = outorderService.update(inorder);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return i;
			}
	
	
	@RequestMapping("/deleteList")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object deleteList(String [] pks){
		System.out.println("---doAjax.deleteList:"+pks);
		int i = 0;
		try {
			i = outorderService.deleteList(pks);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@RequestMapping("/insert") //如果返回json格式，需要这个注解，这里用来测试环境
	public Object insert(Outorder inorder,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException{
		int i = 0;
		try {
			//inorder.setGoodsName(name);
			i = outorderService.insert(inorder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0){
			return "chuhuo.jsp";
		}else
		{
			return i;
		}
	}
	
	//通过关键字分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUseDyc(Page<Outorder> page,Outorder inorder){
		
		page.setParamEntity(inorder);
		System.out.println("----page:"+page);

		Page p = outorderService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
}
