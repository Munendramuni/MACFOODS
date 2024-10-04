package com.macfoods.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.macfoods.connector.ConnectorFactory;
import com.macfoods.dto.Cart;

public class CartDAOImpl implements CartDAO{

	@Override
	public Cart getCartByUserId(int userId) {
		
		try {
			
		PreparedStatement pstmt=ConnectorFactory.requestConnection().prepareStatement("select * from cart where userid=?");
		pstmt.setInt(1, userId);
		
		  ResultSet res= pstmt.executeQuery();
		  
		  while(res.next()) {
			  Cart cart=new Cart(res.getInt(1),res.getInt(2),res.getInt(3),res.getInt(4),res.getInt(5),res.getInt(6));
			  return cart;
		  }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
