package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.BankAccount;

@Repository
public interface BankAccountRepository extends CrudRepository<BankAccount, Long> {

}
