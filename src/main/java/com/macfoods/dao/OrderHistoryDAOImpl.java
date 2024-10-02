package com.macfoods.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.macfoods.connector.ConnectorFactory;
import com.macfoods.dto.OrderHistory;


public class OrderHistoryDAOImpl implements OrderHistoryDAO {

	@Override
	public int insertOrderHistory(OrderHistory oh) {
		try {
			
			  PreparedStatement pstmt=ConnectorFactory.requestConnection()
			  .prepareStatement("insert into order_history (user_id,order_id,total,status)"
					 	+ " values (?,?,?,?)");
			  
			  pstmt.setInt(1, oh.getUserId());
			  pstmt.setInt(2, oh.getOrderId());
			  pstmt.setFloat(3, oh.getTotal());
			  pstmt.setString(4, oh.getStatus());
			  
			 return pstmt.executeUpdate();
		} 
		  
		catch (Exception e) {
			e.printStackTrace();
		}
		  
		  
			
			return 0;

	}
	
	

	@Override
	public List<OrderHistory> getOrdersByUserId(int uid) {
List<OrderHistory> al=new ArrayList<OrderHistory>();
		
		try {
			PreparedStatement pstmt=ConnectorFactory.requestConnection()
			        .prepareStatement("select * from order_history where user_id=?");
			
			pstmt.setInt(1, uid);
			
		ResultSet res=	pstmt.executeQuery();
	    
		while(res.next()) {
		  
			OrderHistory oh=new OrderHistory(res.getInt(1),
					res.getInt(2),
					res.getInt(3),
					res.getFloat(5),
					res.getString(6));
			
			al.add(oh);
			
			
		}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return al;
	}

	@Override
	public int updateOrderHistory(int ohid, String status) {
		
		try {
			PreparedStatement pstmt=ConnectorFactory.requestConnection()
					.prepareStatement("update order_history "
							+ "set status=? where order_history_id=?");
			
			pstmt.setString(1, status);
			pstmt.setInt(2, ohid);
			
		 return pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
			
			
		return 0;	
			
		
		
	}

}
