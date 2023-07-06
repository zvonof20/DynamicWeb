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
        <% // Проверка, был ли отправлен POST-запрос
        if (request.getMethod().equalsIgnoreCase("post")) {
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            // Вызов метода добавления данных в базу данных
            DataBasaFacade.addBook(name, id);
            // После успешного добавления выводим сообщение и название книги
            %><div class="message">Book added: <%= name %></div><%
        } %>
    </div>
</body>
</html>




