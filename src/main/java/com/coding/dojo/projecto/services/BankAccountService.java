package com.coding.dojo.projecto.services;

import com.coding.dojo.projecto.model.BankAccount;

public interface BankAccountService {

	BankAccount findBank(Long id);

	public BankAccount create(BankAccount b) throws Exception;
}
