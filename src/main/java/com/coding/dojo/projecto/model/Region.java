package com.coding.dojo.projecto.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ubications")
public class Region {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String name;
	@OneToMany(mappedBy="region", fetch = FetchType.LAZY)
    private List<Comuna> comuna;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Comuna> getComuna() {
		return comuna;
	}
	public void setComuna(List<Comuna> comuna) {
		this.comuna = comuna;
	}
	
	
}
