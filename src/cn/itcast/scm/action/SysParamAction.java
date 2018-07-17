package cn.itcast.scm.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.entity.SysParam;
import cn.itcast.scm.service.SupplierService;
import cn.itcast.scm.service.SysParamService;

@Controller
@RequestMapping("/sysParam")
public class SysParamAction extends BaseAction {
	@Resource
	private SysParamService sysParamService;

	
	 @RequestMapping(value="/insert")
	 @ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境	 
	public Object insert(SysParam sysParam){
		 //添加到数据库的系统参数表
		 
		 reloadSysParam();
		
		 return null;
	}
	
	
	
	//后边可以用来重新加载参数
	@RequestMapping(value="/reload")
	@ResponseBody
	public void reloadSysParam() {
		loadSysParam();
	}
	
	//系统启动时加载参数  @PostContruct是spring框架的注解，
	//在方法上加该注解会在项目启动的时候执行该方法，也可以理解为在spring容器初始化的时候执行该方法。
	@PostConstruct
	public void initSysParam(){
		loadSysParam();
	}
	
	//用来加载系统参数	
	public void loadSysParam(){
		Map<String, Object> sysParamMap = sysParamService.selectList();
		application.setAttribute("sysParam", sysParamMap);
	}
	

}
