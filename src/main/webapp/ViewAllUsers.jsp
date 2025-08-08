<%@page import="java.util.ArrayList"%>
<%@page import="in.pentagon.studentapp.dto.Student"%>
<%@page import="in.pentagon.studentapp.dao.StudentDAOImpl"%>
<%@page import="in.pentagon.studentapp.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Users Page</title>
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
        #back{
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

        #back:active {
            background-color: rgb(159, 13, 13);
        }

        .heading{
            text-align: center;
        }

        .users{
            margin: 20px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px black;
        }
        table {
            width: 100%;
            
            border-collapse: collapse;
            text-align: center;
        }
        #btn{
            height: 30px;
            width: 60px;
            border: none;
            border-radius: 10px;
            background-color: red;
            color: beige;
            padding: 10px auto;
            
            
            
        }

        #btn:active {
            background-color: rgb(159, 13, 13);
        }

        .success{
        	color:green;
        	text-align: center;
        	font-size: medium;
        	font-weight: 400;
        }
        .error{
        	color: red;
        	text-align: center;
        	font-size: medium;
        	font-weight: 400;
        }
    </style>
</head>
<body>
	<%if(session.getAttribute("student") != null){
		Student s = (Student)session.getAttribute("student");
		StudentDAO sdao = new StudentDAOImpl();
		ArrayList<Student> sList = sdao.getStudent(); 
	%>
    <header>
       <h2>Welcome <%=s.getName() %> (Admin)</h2>    
        <button id="back" onclick="window.location.href='Dashboard.jsp'">Back</button>
    </header>

    <main>
             <%if(request.getAttribute("success") != null){ %>
			<h3 class = "success"><%= request.getAttribute("success") %></h3>
			<%} %>
	
        <div class="heading">
            <h2>View All Users</h2>
        </div>
        <div class="users">
            <table border="1" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Branch</th>
                        <th>Location</th>
                        <th>Remove</th>
                    </tr>

                </thead>
                <tbody>
                <%for(Student sl : sList){ %>
                    <tr>
                        <td><%=sl.getId() %></td>
                        <td><%=sl.getName() %></td>
                        <td><%=sl.getPhone() %></td>
                        <td><%=sl.getMail() %></td>
                        <td><%=sl.getBranch() %></td>
                        <td><%=sl.getLoc() %></td>
                        <td><form action="delete" method="post">
                                <input type="hidden" name="id" value="<%=sl.getId()%>">
                                <input type="submit" value="Remove" id="btn">
                            </form>
                        </td>
                    </tr>
                   <%} %>
                </tbody>
            </table>
        </div>
    </main>
        <%}else{
			request.setAttribute("error", "Session Expired!");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
    %>
</body>
</html>