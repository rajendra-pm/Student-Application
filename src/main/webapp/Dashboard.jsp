<%@page import="java.util.ArrayList"%>
<%@page import="in.pentagon.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js" integrity="sha512-b+nQTCdtTBIRIbraqNEwsjB6UvL3UEMkXnhzd8awtCYh0Kcsjl9uEgwVFVbhoj3uu1DO1ZMacNvLoyJJiNfcvg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <title>Dashboard</title>
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap');
        *{
            font-family: "Outfit", sans-serif;

        }
        body{
           margin: 0px;
           padding: 0px; 
        }
        header{
            display: flex;
            background-color: darkblue;
            justify-content: space-between;
            border-radius: 0px 0px 15px 15px;
            width: 100%;
          


        }
        header h2{
            color: cadetblue;
            margin-left: 50px;
        
            
        }
        span{
            display: flex;
            justify-content: start;
        }
        #name{
            margin-left: 10px;
            color: chocolate;
        }

        
        .menu{
            margin-right: 30px;
            /* width: 100%; */
            display: flex;
            justify-content: end;
            /* margin-left: 0px; */
        }
        .menu a{
            text-decoration: none;
            color: beige;
            margin: 0px 20px ;
            align-content:  center;
            
        }
        .menu a :hover{
            border-radius: 10px;
            background-color: beige;
            color: black;
            height: 40px;
            padding: 0px 5px;
            margin: 15px 0px;
            align-content:  center;
            
        }

        #logout{
            height: 50px;
            width: 80px;
            margin-top: 10px;
            margin-right: 50px;
            border: none;
            border-radius: 10px;
            background-color: red;
            color: beige;
            font-size: 17px;
            font-weight: bold;
            box-shadow: 0px 0px 10px black;
        }

        #logout:active {
            background-color: rgb(159, 13, 13);
        }

        .sec1{
            /* width: 100%; */
            padding: 25px 0px 30px 30px;
            /* border: 2px solid black; */
            border-radius: 10px;
            box-shadow: 0px 0px 10px black;
            margin: 20px;
            
        }
        .tab1{
            width:100%;     
        }
        .tab1 tr{
            font-size: 17px;
            display: flex;
        
        }
        .details{
            margin-left: 5px;
            margin-right:20px ;    
            border: 1px solid black;
            padding-left: 10px;
            padding-right: 10px;
            background-color: lightgrey;
            /* height: 30px; */
           
        }
        .sec2{
            height: 70px;
            width: 100%;
            background-color: darkblue;
            border-radius: 10px;
            display: flex;
            
           

        }
        #icon{
            position:relative;
            left: 40px;
            top:2px
        }
        #search{
            height: 35px;
            width: 250px;
            border-radius: 10px;
            border: none ;
            padding-left: 30px;
            margin-top: 15px;
            margin-left: 15px;
        }
        #search:active{
            border: none;
            
        }
		.success{
        	color:green;
  
        	font-size: large;
        	font-weight: 400;
        	text-align: center;
        }
         .error{
        	color: red;
        	text-align: center;
        }
        
        #searchBtn{
            height: 35px;
            width: 70px;
            margin-top: 10px;
            margin-right: 50px;
            border: none;
            border-radius: 8px;
            background-color: cadetblue;
            color: beige;
            font-size: 15px;
            box-shadow: 0px 0px 10px black;
        }

        #searchBtn:active {
            background-color: darkcyan;
            cursor: pointer;
        }
		 .sec3{
            margin: 20px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px black;
        }
        .userTab {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

    </style>
</head>
<body>
	<%if(session.getAttribute("student") != null){ %>
		 	<%Student s = (Student)session.getAttribute("student"); %>
		 	
		 	
    <header>
		
       <span><h2>Welcome </h2><h2 id="name"><%=s.getName() %></h2></span> 
        <div class="menu">
        	
        
         <%if(s.getId() == 1){%>
            
         <% }%>
            <a href="ViewAllUsers.jsp"><h3>View All Users</h3></a>
            <a href="Update.jsp"><h3>Update Account</h3></a>
            <a href="resetPassword.jsp"><h3>Reset Password</h3></a>
            <form action="logout" method="post"><input type="submit" value="Logout" id="logout"></form>
<!--             <button id="logout" onclick="window.location.href='login.jsp'">Log out</button> -->
        </div>

    </header>

    <main>
    	    <%if(request.getAttribute("success") != null){ %>
			<h3 class = "success"><%= request.getAttribute("success") %></h3>
			<%} %>
			<%-- <%=session.getId() %> --%>
        <section class="sec1">
            <h1>Student Details:</h1>
            <table class="tab1" >
                <tr>
                    <td>Student ID: </td>
                    <td  class="details"><%=s.getId() %></td>
              
                    <td>Student Name: </td>
                    <td class="details"><%=s.getName() %></td>
            
                    <td>Student Phone No.: </td>
                    <td class="details"><%=s.getPhone() %></td>
               
                    <td>Student Mail ID: </td>
                    <td class="details"><%=s.getMail() %></td>
                   
                    <td>Student Branch: </td>
                    <td class="details"><%=s.getBranch() %></td>
                    
                    <td>Student Location: </td>
                    <td class="details"><%=s.getLoc() %></td>
                    
                </tr>

            </table>


        </section>
		
        <section class="sec2">
	        <form action="searchUsers" method="post" >  
	        	<i class="fa-solid fa-magnifying-glass" id="icon" ></i>
	            <input type="search" name="search" id="search" placeholder="Search Users">
	            <input type="submit" value="Search" id="searchBtn">
			</form>    
        </section>
        <%if(request.getAttribute("users") != null){ %>
        <section class = "sec3">
                <table border="1" class="userTab" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Branch</th>
                        <th>Location</th>
                    </tr>

                </thead>
                <tbody>
                <%for(Student sl : (ArrayList<Student>)request.getAttribute("users")){ %>
                    <tr>
                        <td><%=sl.getId() %></td>
                        <td><%=sl.getName() %></td>
                        <td><%=sl.getPhone() %></td>
                        <td><%=sl.getMail() %></td>
                        <td><%=sl.getBranch() %></td>
                        <td><%=sl.getLoc() %></td>
                    </tr>
                   <%} %>
                </tbody>
            </table>
        </section>
        <%} else{
        		if(request.getAttribute("error") != null){ %>
        			<h3 class = "error"><%=request.getAttribute("error") %></h3>
        		<%} %>
       
        <%} %>
    </main>
    <%} 
		else{
			request.setAttribute("error", "Session Expired!");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
    %>
</body>
</html>
