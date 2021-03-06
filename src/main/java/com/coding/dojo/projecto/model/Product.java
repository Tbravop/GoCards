package com.coding.dojo.projecto.model;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Table(name="productos")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(updatable=false)
	@Size(min=4,  message = "El nombre debe tener al menos 4 caracteres")
	private String name;
	@Min(300)
	private BigInteger price;
	@Column(updatable=false)
	@Size(min=4,  message = "Debe agregar una descripcion")
	private String description;
	private String image;
	@Min(1)
	private Integer cantidad;
	private boolean discountActive;
	@Max(99)
	private double discount;
	private BigInteger discountPrice;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "categories_products", 
        joinColumns = @JoinColumn(name = "product_id"), 
        inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private List<Category> categories;
	
	@OneToMany(mappedBy="product", fetch = FetchType.LAZY)
    private List<ProductCart> productCart;
	
	
	public Product() {
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	public Long getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public List<ProductCart> getProductCart() {
		return productCart;
	}

	public void setProductCart(List<ProductCart> productCart) {
		this.productCart = productCart;
	}

	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public BigInteger getPrice() {
		return price;
	}

	public void setPrice(BigInteger price) {
		this.price = price;
	}
	public boolean isDiscountActive() {
		return discountActive;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscountActive(boolean discountActive) {
		this.discountActive = discountActive;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public BigInteger getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(BigInteger discountPrice) {
		this.discountPrice = discountPrice;
	}
	public BigInteger calcularDescuento() {
		BigInteger descuento = BigDecimal.valueOf(this.discount).toBigIntegerExact();
		BigInteger precio = this.price;
		BigInteger porcentaje1 = precio.divide(BigInteger.valueOf(100));
		return BigInteger.valueOf(100).subtract(descuento).multiply(porcentaje1);
	}
}
