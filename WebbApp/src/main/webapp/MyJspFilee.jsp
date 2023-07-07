<%@page import="java.util.List"%>
<%@page import="ua.com.Anton.web.DataBasaFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .container {
            border: 1px solid #ccc;
            padding: 20px;
            width: 300px;
            margin: 0 auto;
        }
        
        .message {
            position: absolute;
            top: 10px;
            right: 10px;
            font-style: italic;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="container">
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
        <% 
        List<String> bookList = DataBasaFacade.getBooks();
        for (String book : bookList) {
            %><div><%= book %> 
            <a href="EditJsp.jsp?book=<%= book %>">Edit</a>
            <a href="DeleteJsp.jsp?book=<%= book %>">Delete</a></div><%
        } %>
    </div>
</body>
</html>
