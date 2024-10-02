<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.macfoods.dao.UserDAO" %>
  <%@ page import="java.util.ArrayList" %>
  <%@ page import="com.macfoods.dto.Restaurant" %>
  <%@ page import="com.macfoods.dao.RestaurantDAOImpl" %>
  <%@ page import="com.macfoods.dao.MenuDAOImpl" %>
  <%@ page import="com.macfoods.dto.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="header-style.css">
<link rel="stylesheet" type="text/css" href="homepage-style.css">
<style type="text/css">
     
     .location{
	       display: flex;
	       gap:7px;
	       align-items: center;
      }
     .location img{
           width:30px
      }
      #selectcity{
        
    background-color: black;
    color:yellow;
  border: none;
  border-radius: 4px;
  
  font:inherit;
  font-size:15px;
  
  
  
   margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;

}

.username p{
margin-left:-5px;
	position: absolute;

}

.restaurant-group a{
	text-decoration: none;
	color:black;
}

    
</style>
      
<script src="homepage-script.js"></script>

</head>



<body onload="getSelectedOption()">

 
     <div id="declaration">
   	  
   	  
           
          <%! Cookie[] cookies =null;
          String cityName=null;
          %>
         <%=  cookies=request.getCookies()%>
         
         <% if (cookies != null) {
             for (Cookie cookie : cookies) {
                 if ("selectCity".equals(cookie.getName())) {
                     
                     cityName = java.net.URLDecoder.decode(cookie.getValue(), "UTF-8");
                    
                     break;
                 }
             }
         } 
         %>
         
         
         <%! UserDAO user=null; %>
           <%= user=(UserDAO)session.getAttribute("user") %>

           
          
       </div>
      
    
    <header class="nav-bar">
    
           
      
   	  <div class="logo"> 
   	  	<a href="homepage.jsp" target="_self"><img src="logocompany.png" /></a>
   	  </div>
   	  
   	  
   	  <div class="location">
   	       <img  src="location-icon.png" >
   	       
   	       
   	      
   	          
   	          <select  name="selectcity" id="selectcity" onchange="getCity()" >
   	          
   	             <option  value="Banglore">Banglore</option>
   	             <option  value="Hyderabad"  >Hyderabad</option>
   	             <option  value="Chennai">Chennai</option>
   	             <option  value="Srikalahasti">Srikalahasti</option>
   	             <option  value="Tirupati">Tirupati</option>
   	             <option  value="Vizag">Vizag</option>
   	          
   	          </select>
   	          
   	          
   	       
   	      
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
   
   
   
      <section class="menu">

        
        
             <h2 class="heading" style="color:black">Eat your favourite...</h2>
             <div class="items-group">
                
                 <div class="item">
                 
                     <a href=""><img src="biryani.jpeg"></a>
                    
                 </div>
                 <div class="item">
                 
                     <a href=""><img src="south-indian.jpeg"></a>
                    
                 </div>
                 <div class="item">
                 
                     <a href=""><img src="north-indian.avif"></a>
                    
                 </div>

                 <div class="item">
                 
                     <a href=""><img src="pizzas.avif"></a>
                    
                 </div>
                 <div class="item">
                 
                     <a href=""><img src="burgers.avif"></a>
                    
                 </div>
                 <div class="item">
                 
                     <a href=""><img src="cakes.avif"></a>
                    
                 </div>
                  <div class="item">
                 
                     <a href=""><img src="rolls.avif"></a>
                    
                 </div>
                 <div class="item">
                 
                     <a href=""><img src="chinese.avif"></a>
                    
                 </div>
             
             </div>
    
          
       
   </section>
   
    
  <% ArrayList<Restaurant> arr = (ArrayList<Restaurant>)new RestaurantDAOImpl().getRestaurantsByLocation(cityName); %>
  
   
    <section class="restaurants">
              
            <h2 class="heading"> Explore Restaurants in <%=cityName %></h2>
            <div class="restaurant-group">
                
            <%for(Restaurant res:arr){%>
            	
                  <% ArrayList<Menu> arr1 = (ArrayList<Menu>)new MenuDAOImpl().getResItems(res.getRestaurantId()); %>
                  <%session.setAttribute("RestaurantDetails", res);%>
                 <% session.setAttribute("MenuDetails",arr1); %>
            
                  <a href="restaurant-menu.jsp">   <div class="restaurant">
                    
                  <img src="<%=res.getImgPath()%>">
                   <div class="description">

                      <h4><%=res.getName().toUpperCase()%></h4>

                          <span class="rating">
                             <img src="rating.png"> 
                              <p><%=res.getRatings()%></p>
                              <li><%=res.getDeliveryTime()%> mins</li>
                          </span>
                         <div class="info">

                            
                            <p class="items"> <%for(Menu item:arr1){%>
                            
                            	<%= item.getItemName().substring(0,1).toUpperCase()+item.getItemName().substring(1) %>,
                            	
                            
                          <% }  %>
                      
                            </p>
                            
                            
                             <p class="address"><%=res.getAddress().substring(0, 1).toUpperCase()+res.getAddress().substring(1)%></p> 
                         </div>
                   
                      
                       
                   </div>

                </div>
                
                </a>
              
                <% }%>


            </div>
          
       
   </section>
   

   
      
</body>
</html>