<%@page import="in.pentagon.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Update Account Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap');
        *{
            font-family: "Outfit", sans-serif;

        }
        body {
            margin: 0;
            padding: 0;
        }

        header {
            height: 60px;
            width: 100%;
            color: darkblue;
            font-size: 25px;
            text-align: center;
            margin-top: 20px;
        }

        header h1 {
            margin-top: 0;
            padding: 10px;
        }

        footer h2 {
            padding: 10px;
        }

        .heading {
            text-align: center;
        }

        main {
            height: 560px;
            width: 400px;
            box-shadow: 0px 0px 10px black;
            margin: 80px auto;
            border-radius: 10px;
            padding: 20px;
            /* text-align: center; */
        }


        .inputfield {
            display: flex;
            flex-direction: column;
            padding: 10px;
            font-size: large;

        }

        #txtbox {
            height: 30px;
            width: 350px;
            /* margin: 10px; */
            border-top-style: none;
            border-right-style: none;
            border-left-style: none;
            outline: none;
        }


        .inputfieldSelect{
            display: flex;

            padding: 10px;
            font-size: large;
        }


        .inputfieldSelect select {
            margin-left: 20px;
            width: 100px;

        }


        .inputfieldbtn {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            padding: 10px;
        }

        .inputfieldbtn input {
            border: none;
            background-color: blue;
            color: white;
            height: 40px;
            width: 120px;
            border-radius: 5px;
        }
        #btn2 {
            background-color: green;
            
        }
        #btn2:hover{
            background-color: darkgreen;
            border: 1px solid black;
            cursor: pointer;
        }
        .inputfieldbtn input:hover{
            background-color: darkblue;
            border: 1px solid black;
            cursor: pointer;
        }
        
        .error{
        	color: red;
        	text-align: center;
        	padding: 0px;
        	margin: 0px;
        	font-size: medium;
        	font-weight: 400;
        }
    </style>
</head>

<body>
    <header>
        <h1>Pentagon Space</h1>
    </header>
    <main>
    <%if(session.getAttribute("student") != null){%>
    	<% Student s = (Student)session.getAttribute("student");%>
    
        <form action="Update" method = "post">
            <div class="heading">
                <h1>Update Account</h1>
            </div>
             <%if(request.getAttribute("error") != null){ %>
			<h3 class = "error"><%= request.getAttribute("error") %></h3>
			<%} %>
            <div class="inputfield">
                <label>Enter your Name: </label>
                <input type="text" name="name"  id="txtbox" value="<%=s.getName()  %>">
            </div>

            <div class="inputfield">
                <label>Enter your Phone number: </label>
                <input type="tel" name="phone" id="txtbox" value="<%=s.getPhone()  %>">
            </div>

            <div class="inputfield">
                <label>Enter your Mail ID: </label>
                <input type="email" name="mail"  id="txtbox" value="<%=s.getMail()  %>">
            </div>

            
            <div class="inputfield">
                <label>Select your Branch: </label>
				<input type="text" name="branch"  id="txtbox" value="<%=s.getBranch()  %>">
            </div>

            <div class="inputfield">
                <label>Enter your Location: </label>
                <input type="text" name="loc"  id="txtbox" value="<%=s.getLoc()  %>">
            </div>
-
            <div class="inputfieldbtn">
                <input type="submit" value="Update" id="btn1">
                <input type="button" value="Back" id="btn2" onclick="window.location.href='Dashboard.jsp'">
            </div>


        </form>
        <%}else{
			request.setAttribute("error", "Session Expired!");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
    %>

    </main>


</body>

</html>