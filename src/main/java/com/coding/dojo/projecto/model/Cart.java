package com.coding.dojo.projecto.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="carts")
public class Cart {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	@OneToOne(mappedBy="cart", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Sell sell;
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "product_cart", 
        joinColumns = @JoinColumn(name = "cart_id"), 
        inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Product> product;
	
	public Cart() {
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Sell getSell() {
		return sell;
	}
	public void setSell(Sell sell) {
		this.sell = sell;
	}
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
}
