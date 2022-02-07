package com.coding.dojo.projecto.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@Email
	private String email;
	@Size(min=3)
	private String name;
	@Size(min=3)
	private String lastName;
	@Size(min=8)
	private String password;
	@Transient
	private String passwordConfirm;
	@Size(min=9)
	private String phone;
	private int rating;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private BankAccount account;
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Cart cart;
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
    		name="role_user",
    		joinColumns = @JoinColumn(name="user_id"),
    		inverseJoinColumns = @JoinColumn(name="role_id"))
	private List<Role> role;
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    		name="comuna_user",
    		joinColumns = @JoinColumn(name="user_id"),
    		inverseJoinColumns = @JoinColumn(name="comuna_id"))
	private List<Comuna> comuna;
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Product> product;
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Article> article;
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Comment> comment;
	
	public User() {
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
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
	public List<Role> getRole() {
		return role;
	}
	public void setRole(List<Role> role) {
		this.role = role;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public BankAccount getAccount() {
		return account;
	}
	public void setAccount(BankAccount account) {
		this.account = account;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public List<Comuna> getComuna() {
		return comuna;
	}
	public void setComuna(List<Comuna> comuna) {
		this.comuna = comuna;
	}
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
	
}
