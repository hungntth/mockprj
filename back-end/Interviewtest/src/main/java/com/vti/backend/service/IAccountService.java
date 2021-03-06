package com.vti.backend.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;

public interface IAccountService {
	public Page<Account> getAllAccount(Pageable pageable, String search);
	
	public Account getAccountById(short id);
	
	public void createAccount(AccountFormForCreating form);
	
	public void updateAccount(short id, AccountFormForUpdating form);
	
	public void deleteAccount(short id);
}
