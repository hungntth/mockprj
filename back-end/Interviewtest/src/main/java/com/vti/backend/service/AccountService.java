package com.vti.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;
import com.vti.specification.AccountSpecification;
import com.vti.backend.repository.*;

@Service
public class AccountService implements IAccountService {

	@Autowired
	private IAccountRepository accountRepository;

	@SuppressWarnings("deprecation")
	public Page<Account> getAllAccounts(Pageable pageable, String search) {
		Specification<Account> where = null;
		if (!StringUtils.isEmpty(search)) {
			AccountSpecification nameSpecification = new AccountSpecification("fullname", "LIKE", search);
			AccountSpecification emailSpecification = new AccountSpecification("email", "LIKE", search);
//			AccountSpecification typeSpecification = new AccountSpecification("type", "LIKE", "type.Manager");
			where = Specification.where(nameSpecification);
		}
		return accountRepository.findAll(where, pageable);
	}

	@Override
	public Account getAccountById(short id) {
		return accountRepository.getById(id);
	}
	
	@Override
	public void deleteAccount(short id) {
		accountRepository.deleteById(id);
	}
	
	@Override
	public void createAccount(AccountFormForCreating form) {
		Account account = new Account();
		account.setEmail(form.getEmail());
		account.setFullname(form.getFullname());
		accountRepository.save(account);
	}

	@Override
	public void updateAccount(short id, AccountFormForUpdating form) {
		Account account = accountRepository.getById(id);
		account.setFullname(form.getFullname());
		accountRepository.save(account);
	}
	
	@Override
	public Page<Account> getAllAccount(Pageable pageable, String search){
		return null;
	}
}
