package com.macfoods.dao;

import com.macfoods.dto.Cart;

public interface CartDAO {
    Cart getCartByUserId(int userId);
}
