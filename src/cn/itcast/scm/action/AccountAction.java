package cn.itcast.scm.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.SupplierService;
//��¼���Ʋ�
@Controller
@RequestMapping("/account")
public class AccountAction extends BaseAction {
	@Resource
	private AccountService accountService;
	
	@RequestMapping(value="/login")
	public String login(Account account,HttpServletRequest request,HttpSession session){
		Account acc= accountService.login(account);
		if(acc!=null){
			//��session
			session.setAttribute("account", acc);
			return "forward:/WEB-INF/main/main.jsp";
		}else{
			request.setAttribute("msg", "�û������������");
			return "forward:/index.jsp";
		}
		
	}
	
	@RequestMapping("/doAjax")
	@ResponseBody //�������json��ʽ����Ҫ���ע�⣬�����������Ի���
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}


}
