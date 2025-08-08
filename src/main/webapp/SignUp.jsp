<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>Signup Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
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

        .heading {
            text-align: center;
        }
        
        .error{
            color: red;
        }
        main {
            height: 670px;
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


        .btn {
            margin: 20px;
            text-align: center;
            height: 40px;
            width: 200px;
            border: none;
            border-radius: 5px;
            background-color: blue;
            color: white;
            font-size: larger;


        }


        .btn:hover {
            background-color: white;
            color: black;
            border: 1px solid black;
            cursor: pointer;
        }

        .txt {
            text-align: center;
            font-size: small;
        }
    </style>
</head>

<body>
    <header>
        <h1>Pentagon Space</h1>
    </header>
    <main>
        <form action="SignUp" method="post">
            <div class="heading">
                <h1>Application Form</h1>
            </div>
            
            <%if(request.getAttribute("error")!=null){%>
            <h3 class="error"><%=request.getAttribute("error")%></h3>
            <%}%>
            
            <div class="inputfield">
                <label>Enter your Name: </label>
                <input type="text" name="name" required id="txtbox">
            </div>

            <div class="inputfield">
                <label>Enter your Phone number: </label>
                <input type="text" name="phone" id="txtbox">
            </div>

            <div class="inputfield">
                <label>Enter your Mail ID: </label>
                <input type="email" name="mail" required id="txtbox">
            </div>

            
            <div class="inputfieldSelect">
                <label>Select your Branch: </label>
                <select name="branch">
                    <option value="CSE">CSE</option>
                    <option value="ISE">ISE</option>
                    <option value="ECE">ECE</option>
                    <option value="AIML">AIML</option>
                    <option value="Mech">Mech</option>
                    <option value="Civil">Civil</option>
                </select>
            </div>
            
            <div class="inputfield">
                <label>Enter the Location: </label>
                <input type="location" name="location" required id="txtbox">
            </div>
            
            <div class="inputfield">
                <label>Enter the Password: </label>
                <input type="password" name="password" required id="txtbox">
            </div>

            <div class="inputfield">
                <label>Confirm your Password: </label>
                <input type="password" name="comfirmpass" required id="txtbox">
            </div>

            <center><input type="submit" value="Sign Up" class="btn"></center>

            <div class="txt">
                <p>Already have an account? <a href="Login.jsp">Click here</a> to Login</p>
            </div>

        </form>

    </main>

</body>

</html>