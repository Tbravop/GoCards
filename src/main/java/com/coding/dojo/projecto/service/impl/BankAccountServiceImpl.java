package com.coding.dojo.projecto.service.impl;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.BankAccount;
import com.coding.dojo.projecto.repository.BankAccountRepository;
import com.coding.dojo.projecto.services.BankAccountService;

@Service
public class BankAccountServiceImpl implements BankAccountService {

	@Autowired 
	private BankAccountRepository bankAccountRepository;
	
	public BankAccount create(BankAccount b) {
		return bankAccountRepository.save(b);
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
