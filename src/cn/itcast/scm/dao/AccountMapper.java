package cn.itcast.scm.dao;

import cn.itcast.scm.entity.Account;
//��¼dao��
public interface AccountMapper extends BaseMapper<Account> {
	public Account login(Account account);

}