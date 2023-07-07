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
        <h2>Delete Book:</h2>
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
