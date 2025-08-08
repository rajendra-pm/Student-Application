<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

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
            font-size: 30px;
            text-align: center;
            margin-top: 20px;
        }

        h1 {
            margin: 10px;
        }

        .container {
            height: 375px;
            width: 400px;
            box-shadow: 0px 0px 10px black;
            margin: 80px auto;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
        }

        label {
            font-size: large;
            margin-top: 15px;
        }
        .inputfield {
            display: flex;
            padding: 10px;
            font-size: large;
        }

        .inputfield input {
            height: 30px;
            width: 300px;
            margin: 10px;
            border-top-style: none;
            border-right-style: none;
            border-left-style: none;
            outline: none;
        }

        /* .btn {
            margin: 10px;
        } */

        .heading {
            font-size: 20px;
        }

        p {
            font-size: small;
        }

        .btn {
            height: 40px;
            width: 200px;
            border: none;
            border-radius: 10px;
            background-color: blue;
            color: white;
            font-size: larger;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: darkblue;
            border: 1px solid black;
            cursor: pointer;
        }

        header h1 {
            margin: 0;
        }

        .inputbtn {
            display: flex;
            justify-content: space-between;
            align-items: center;

            padding: 10px;
        }
        
        .success{
        	color:green;
        	margin: 0px;
        	padding: 0px;
        	font-size: medium;
        	font-weight: 400;
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
        <div class="container">
            <div class="heading">
                <h1>Login</h1>
            </div>
            <%if(request.getAttribute("success") != null){ %>
			<h3 class = "success"><%= request.getAttribute("success") %></h3>
			<%} %>
			<%if(request.getAttribute("error") != null){ %>
			<h3 class = "error"><%= request.getAttribute("error") %></h3>
			<%} %>
            <form action="Login" method="post">
                <div class="inputfield">
                    <label>Mail:</label>
                    <input type="email" name="mail" required>
                </div>
                <div class="inputfield">
                    <label>Password:</label>
                    <input type="password" name="Password" required>
                </div>
                <input type="submit" value="Login" class="btn">
                <div class="inputbtn">
                     <p>Don't have an account? <a href="SignUp.jsp">Sign Up</a></p>
                    <p><a href="resetPassword.jsp">Forgot password?</a></p>
                </div>

               

            </form>

        </div>
    </main>

</body>

</html>