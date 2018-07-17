package cn.itcast.scm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.service.AccountService;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {
	
	@Override
	public Account login(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.login(account);
	}
	
}
