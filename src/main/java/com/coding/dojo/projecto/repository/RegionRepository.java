package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Region;

@Repository
public interface RegionRepository extends CrudRepository<Region, Long> {

}
