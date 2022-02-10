package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Sell;
import com.coding.dojo.projecto.repository.SellRepository;
import com.coding.dojo.projecto.services.SellService;

@Service
public class SellServiceImpl implements SellService {

	@Autowired
	private SellRepository sellRepository;
	
	@Override
	public List<Sell> AllSell() {
		return (List<Sell>) sellRepository.findAll();
	}
	@Override
	@Transactional
    public Sell create(Sell s) {
        return sellRepository.save(s);
    }
	@Override
	@Transactional
	public Sell findSell(Long id) {
		Optional<Sell> optionalSell = sellRepository.findById(id);
		if(optionalSell.isPresent()) {
			return optionalSell.get();
		}
		else {
			return null;
		}
	}
	
}
