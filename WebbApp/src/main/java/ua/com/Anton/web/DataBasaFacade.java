package ua.com.Anton.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBasaFacade {
    public static List<String> getBooks() {
        List<String> result = new ArrayList<String>();
        
        try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres5","postgres", "1234")) {
            System.out.println("Connect to DataBase");
            
            Statement statement = connection.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT * FROM chat.app");
            
            while (resultSet.next()) {
                result.add(resultSet.getString("name"));
            }
                    
        } catch (SQLException e) {
            System.out.println("Connection fail");
            e.printStackTrace();
        }
        
        return result;
    }
    
    public static void addBook(String name, int id) {
        try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres5","postgres", "1234")) {
            
            String insertQuery = "INSERT INTO chat.app (name, id) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, id);
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Add book failed");
            e.printStackTrace();
        }
    }
    
    public static void updateBook(String currentName, String newName) {
        try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres5","postgres", "1234")) {
            
            String updateQuery = "UPDATE chat.app SET name = ? WHERE name = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, newName);
            preparedStatement.setString(2, currentName);
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Edit book failed");
            e.printStackTrace();
        }
    }
    
    public static void deleteBook(String name) {
        try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres5","postgres", "1234")) {
            
            String deleteQuery = "DELETE FROM chat.app WHERE name = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setString(1, name);
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Delete book failed");
            e.printStackTrace();
        }
    }
    
    public static List<String> searchBooks(String keyword) {
        List<String> result = new ArrayList<String>();
        
        try(Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres5","postgres", "1234")) {
            System.out.println("Connect to DataBase");
            
            String searchQuery = "SELECT * FROM chat.app WHERE name LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(searchQuery);
            preparedStatement.setString(1, "%" + keyword + "%");
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                result.add(resultSet.getString("name"));
            }
                    
        } catch (SQLException e) {
            System.out.println("Connection fail");
            e.printStackTrace();
        }
        
        return result;
    }
}
