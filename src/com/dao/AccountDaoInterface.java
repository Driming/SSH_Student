package com.dao;

import java.util.List;

import com.entity.Account;

public interface AccountDaoInterface {

	public void addAccount(Account account);
	public Account findAccountById(int id);
	public void updateAccount(Account account);
	public void deleteAccount(int id);
	public List<Account> findRecPages(int page,int pageSize);
}
