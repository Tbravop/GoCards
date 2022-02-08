package com.coding.dojo.projecto.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Region;
import com.coding.dojo.projecto.repository.RegionRepository;
import com.coding.dojo.projecto.services.RegionService;

@Service
public class RegionServiceImpl implements RegionService{

	@Autowired 
	private RegionRepository regionRepository;
	
	@Override 
	public List<Region> allRegion(){
		return (List<Region>) regionRepository.findAll();
	}
	
}
