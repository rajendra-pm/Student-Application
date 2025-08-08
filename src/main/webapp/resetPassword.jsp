<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Password Page</title>

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

        header h1 {
            margin-top: 0;
            padding: 10px;
        }

        footer h2 {
            padding: 10px;
        }

        main {
            height: 540px;
            width: 400px;
            box-shadow: 0px 0px 10px black;
            margin: 80px auto;
            border-radius: 10px;
            padding: 25px;
            /* text-align: center; */
        }

        .heading {
            text-align: center;
        }

        .inputfield {
            display: flex;
            flex-direction: column;
            padding: 10px;
            font-size: large;

        }

        .inputfield input[name] {
            height: 30px;
            width: 350px;
            /* margin: 10px; */
            border-top-style: none;
            border-right-style: none;
            border-left-style: none;
            outline: none;
        }

        .inputfieldOTP {
            margin: 10px;
            font-size: large;
        }

        .inputfieldOTP input {
            border-top-style: none;
            border-right-style: none;
            border-left-style: none;
            outline: none;
            margin: 5px;
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

        <form action="password" method="post">
            <div class="heading">
                <h1>Reset Password</h1>
            </div>
            <%if(request.getAttribute("error") != null){ %>
			<h3 class = "error"><%= request.getAttribute("error") %></h3>
			<%} %>
            <div class="inputfield">
                <label>Enter your Phone number: </label>
                <input type="tel" name="phone" required>
            </div>
            <div class="inputfield">
                <label>Enter your Mail ID: </label>
                <input type="email" name="mail" required>
            </div>
            <div class="inputfield">
                <label>Enter the new Password: </label>
                <input type="password" name="password" required>
            </div>
            <div class="inputfield">

                <label>Confirm the Password: </label>
                <input type="password" name="confirm" required>
            </div>
    
            <div class="inputfieldbtn">
                <input type="submit" value="Reset Password" id="btn1">
                <input type="button" value="Back" id="btn2" onclick="window.location.href='Dashboard.jsp'">
            </div>
        </form>
    </main>


</body>

</html>