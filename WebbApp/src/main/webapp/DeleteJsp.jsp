<%@page import="ua.com.Anton.web.DataBasaFacade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            box-sizing: border-box;
        }
        
        h1 {
            text-align: center;
            margin-top: 0;
        }
        
        form {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            background-color: #f44336;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        
        input[type="submit"]:hover {
            background-color: #d32f2f;
        }
        
        .message {
            font-style: italic;
            color: #999;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Book</h1>
        <form action="" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" value="<%= request.getParameter("book") %>" readonly><br>
            <input type="submit" value="Delete Book">
        </form>
        <% 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String name = request.getParameter("name");
            
            DataBasaFacade.deleteBook(name);
           
            %><div class="message">Book deleted: <%= name %></div><%
            response.sendRedirect("MyJspFilee.jsp"); 
        } %>
    </div>
</body>
</html>
