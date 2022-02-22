package com.coding.dojo.projecto.model;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="ventas")
public class Sell {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String numero;
	private Integer cantidad;
	private BigInteger price;
	private BigInteger total;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cart_id")
    private Cart cart;
	
	public Sell() {
	}
	
	public Sell(long id, String numero, Integer cantidad, BigInteger price, BigInteger total, Date createdAt,
			Date updatedAt, Cart cart) {
		super();
		this.id = id;
		this.numero = numero;
		this.cantidad = cantidad;
		this.price = price;
		this.total = total;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.cart = cart;
	}


	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public BigInteger getPrice() {
		return price;
	}

	public void setPrice(BigInteger price) {
		this.price = price;
	}

	public BigInteger getTotal() {
		return total;
	}

	public void setTotal(BigInteger total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Sell [id=" + id + ", numero=" + numero + ", cantidad=" + cantidad + ", price=" + price + ", total="
				+ total + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", cart=" + cart + "]";
	}

	
	
	
	
	
}
