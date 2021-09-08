package com.vti.backend.controller;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.vti.DTO.AccountDTO;
import com.vti.entity.Account;
import com.vti.form.AccountFormForCreating;
import com.vti.form.AccountFormForUpdating;
import com.vti.backend.service.AccountService;
import com.vti.backend.service.IAccountService;

@RestController
@RequestMapping(value = "api/v1/accounts")
@CrossOrigin("*") // phân quyền, những ứng dụng nào có thể vào được đường link trên
public class AccountController {
	@Autowired
	private IAccountService accountService;

	@GetMapping() // Get lấy dữ liệu
	public ResponseEntity<?> getAllAccount(Pageable pageable, @RequestParam(required = false) String search) {
		Page<Account> entitiesPage = accountService.getAllAccount(pageable, search);

		Page<AccountDTO> dtoPage = entitiesPage.map(new Function<Account, AccountDTO>() {
			@Override
			public AccountDTO apply(Account entity) {
				// convert entities --> dtos
				AccountDTO dto = new AccountDTO(entity.getId(), entity.getFullname(), entity.getUsername(),
						entity.getEmail(), entity.getPassword(), entity.getType().toString(), entity.getCreateDate());
				return dto;
			}
		});
		return new ResponseEntity<>(dtoPage, HttpStatus.OK);
	}
	
	@GetMapping(value = "{/id}")
	public ResponseEntity<?> getAccountById(@PathVariable(name = "id") short id){
		Account account = accountService.getAccountById(id);
		AccountDTO dto = new AccountDTO(account.getId(), account.getFullname(), account.getUsername(), account.getEmail(), account.getPassword(), account.getType().name(), account.getCreateDate());
		return new ResponseEntity<AccountDTO>(dto, HttpStatus.OK);
	}
	
	@PostMapping()
	public ResponseEntity<?> createAccount( AccountFormForCreating form){
		accountService.createAccount(form);
		return new ResponseEntity<String>("Create successfully!", HttpStatus.CREATED);
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> updateAccount(@PathVariable(name = "id") short id,  AccountFormForUpdating form){
		accountService.updateAccount(id, form);
		return new ResponseEntity<String>("Updating successfully!", HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteAccount(@PathVariable(name = "id") short id){
		accountService.deleteAccount(id);
		return new ResponseEntity<String>("Delete successfully!", HttpStatus.OK);
	}
}
