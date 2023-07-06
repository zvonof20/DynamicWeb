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
				System.out.println("Connect to DataBase	");
				
				Statement statment = connection.createStatement();
				
				ResultSet resultSet = statment.executeQuery("SELECT * FROM chat.app");
				
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
				
				String insertQuery = ("INSERT INTO chat.app (name, id) VALUES (?, ?)");
				  PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
				  preparedStatement.setString(1, name);
				  preparedStatement.setInt(2, id);
				  
				  preparedStatement.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("add book is fail");
				e.printStackTrace();
			}
		}
}

