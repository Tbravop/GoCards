package com.coding.dojo.projecto.services;

import java.util.List;

import com.coding.dojo.projecto.model.Sell;

public interface SellService {

	List<Sell> AllSell();

	Sell create(Sell s);

	Sell findSell(Long id);

}
