<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.macfoods.dto.Restaurant" %>
    <%@ page import="java.util.ArrayList" %>
      <%@ page import="com.macfoods.dto.Menu" %>
      <%@ page import="com.macfoods.dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<link rel="stylesheet" type="text/css" href="restaurant-menu-style.css">

<link rel="stylesheet" type="text/css" href="header-style.css">

<style>

  .username  {
	
    
    position:absolute;
    top:30px;
    right:50px;
}

</style>
</head>
<body>
<div class="hidden">

   <%!Restaurant res=null; 
       ArrayList<Menu> menu=null;
    %>
    <%= res=(Restaurant)session.getAttribute("RestaurantDetails")%>
        <%= menu=(ArrayList<Menu>)session.getAttribute("MenuDetails") %>
        
         <%! UserDAO user=null; %>
           <%= user=(UserDAO)session.getAttribute("user") %>
</div>

    <header class="nav-bar">
    
           
      
   	  <div class="logo"> 
   	  	<a href="homepage.jsp" target="_self"><img src="logocompany.png" /></a>
   	  </div>
   	  
   	  
   	  <div class="location">
   	       
   	      
   	  </div>
   	  
   	  
   	
   	  

   	  <div class="search-box"> 
           <input type="text" placeholder="Taste for your favourite food">
           <button>Explore</button>
   	  </div>
   	  

   	  
   	   
   	 
   	 <%  if(user!=null) 
   	  { %>
   	     
   	    <div class="nav-links">
   	  	<a href="fashion.html" target="_self">Offers</a>
   	  	<a href="deals.html" target="_self">Help</a>
   	  	<a href="restaurants.jsp" target="_self">Restaurants</a>
   	  	<a href="deals.html" target="_self">Orders</a>

   	    </div>
   	    
   	    <div class="username">
             
             <p><%= (String)session.getAttribute("username") %></p>

       </div>
   	     
   	  <%}else{%> 
   		  
   		<div class="nav-links">
   	  	<a href="fashion.html" target="_self">Offers</a>
   	  	<a href="deals.html" target="_self">Help</a>
   	  	<a href="login.html" target="_self">Login</a>
   	  	<a href="registration.html" target="_self">Signup</a>
   	  	</div>
   		  <% }%> 
    

   	  <div class="nav-icons">
   	  	
   	  	<img src="profile-icon.png">
   	  	<img src="cart-icon.png">

   	  </div>
   	 

   </header>
    
        
    <section class="restaurant-details">
   	
       <h1><%=res.getName() %></h1>
       

       	   <div class="description">

       	<div class="rating">  
       		<img src="rating.png">
       		<h4><%=res.getRatings() %></h4>

       	</div>

       	<span class="cuision"> 
       	    <%=res.getCuisineType() %>
       	</span>
       	
        <div class="reach-logo-time">
        	
           <img src="line.png">
           <h4 id="outlet">outlet</h4>
           <h4 id="expected-time"><%=res.getDeliveryTime() %> mins</h4>

        </div>

       </div>
       


   </section>

   <section class="menu-items"> 
   	     
   	     
         <div  class="items-group">
         	<h1>Available Items</h1>
         	
         	
         	<% for(Menu item:menu){%>
         	
              <div class="item">

              	<div class="details">
              		<h4><%=item.getItemName() %></h4>
              	<p>₹<%=(int)item.getPrice() %></p>

              	<p id="desc"><%= item.getDescription() %></p>

              	</div>

              	<div class="image-cart">
              		
                    <img src="chicken.avif">
                    <button>ADD</button>
              	</div>


              	

              </div>
              
              <%} %>

              


               
         </div>


   </section>
    
    
    
</body>
</html>