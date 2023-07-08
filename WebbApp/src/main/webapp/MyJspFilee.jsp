<%@page import="ua.com.Anton.web.DataBasaFacade"%>
<%@page import="java.util.List"%>
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
        
        .date {
            text-align: right;
            font-size: 14px;
            color: #999;
            margin-bottom: 10px;
        }
        
        form {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .message {
            font-style: italic;
            color: #999;
            margin-bottom: 10px;
        }
        
        .book-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        
        .book-list-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        
        .book-list-item:last-child {
            border-bottom: none;
        }
        
        .book-list-item a {
            margin-left: 10px;
            color: #4CAF50;
            text-decoration: none;
        }
        
        .book-list-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Book Library</h1>
        <div class="date">Current Date and Time: <%= new java.util.Date() %></div>
        <form action="" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required><br>
            <label for="id">ID:</label>
            <input type="number" name="id" id="id" required><br>
            <input type="submit" value="Add Book">
        </form>
        <% 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            
            DataBasaFacade.addBook(name, id);
            
            %><div class="message">Book added: <%= name %></div><%
        } %>
        
        <h2>Book List:</h2>
        <ul class="book-list">
            <% 
            List<String> bookList = DataBasaFacade.getBooks();
            for (String book : bookList) {
                %><li class="book-list-item"><%= book %> 
                <a href="EditJsp.jsp?book=<%= book %>">Edit</a>
                <a href="DeleteJsp.jsp?book=<%= book %>">Delete</a></li><%
            } %>
        </ul>
    </div>
</body>
</html>
