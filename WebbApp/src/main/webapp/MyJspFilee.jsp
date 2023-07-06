<%@page import="ua.com.Anton.web.DataBasaFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>List of books:</h1>
    <ul>
        <% for(String name : DataBasaFacade.getBooks()) { %>
            <li><%= name %></li>
        <% } %>
    </ul>

    <h2>Add a new book:</h2>
    <form action="" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>
        <br>
        <label for="id">ID:</label>
        <input type="number" name="id" id="id" required>
        <br>
        <input type="submit" value="Add Book">
    </form>

    <%
        // Проверка, был ли отправлен POST-запрос
        if (request.getMethod().equalsIgnoreCase("post")) {
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));

            // Вызов метода добавления данных в базу данных
            DataBasaFacade.addBook(name, id);

            // После успешного добавления делаем редирект на эту же страницу
            response.sendRedirect(request.getRequestURI());
        }
    %>

</body>
</html>
