package com.macfoods.dto;

public class Cart {
   
	private int cartId;
	private int menuId;
	private int restId;
	private int quantity;
	private int totalCart;
	private int userId;
	
	public Cart(int cartId, int menuId, int restId, int quantity, int totalCart, int userId) {
		super();
		this.cartId = cartId;
		this.menuId = menuId;
		this.restId = restId;
		this.quantity = quantity;
		this.totalCart = totalCart;
		this.userId = userId;
	}

	public Cart(int menuId, int restId, int quantity, int totalCart, int userId) {
		super();
		this.menuId = menuId;
		this.restId = restId;
		this.quantity = quantity;
		this.totalCart = totalCart;
		this.userId = userId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getRestId() {
		return restId;
	}

	public void setRestId(int restId) {
		this.restId = restId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalCart() {
		return totalCart;
	}

	public void setTotalCart(int totalCart) {
		this.totalCart = totalCart;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
}
