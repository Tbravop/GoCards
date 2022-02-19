package com.coding.dojo.projecto.service.impl;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.BankAccount;
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.repository.BankAccountRepository;
import com.coding.dojo.projecto.services.BankAccountService;
import com.coding.dojo.projecto.services.UserService;

@Service
public class BankAccountServiceImpl implements BankAccountService {

	@Autowired 
	private BankAccountRepository bankAccountRepository;
	@Autowired
	private UserService userService;
	
	public BankAccount create(BankAccount b) throws Exception  {
		User user = userService.getLoggedInUser();
		if(user != null) {
		return bankAccountRepository.save(b);
		}
		else {
			throw new Exception("El usuario no esta logeado");
		}
	}
	@Override
	@Transactional
	public BankAccount findBank(Long id) {
		Optional<BankAccount> optionalBank = bankAccountRepository.findById(id);
		if(optionalBank.isPresent()) {
			return optionalBank.get();
		}
		else {
			return null;
		}
	}
}
