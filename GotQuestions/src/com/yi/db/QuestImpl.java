package com.yi.db;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class QuestImpl implements Quest {

	@Override
	public void selectProduct(String name) throws ClassNotFoundException, SQLException, IOException {
		String nm;
		String stmt;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = null;
		connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", "admin",
				"admin123");
			nm="apoorv";
		stmt="Select * from client WHERE name =\'"+name+"\'";
		System.out.println("stmt----------->"+stmt);
		java.sql.Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(stmt);
		while(rs.next()){
		     //Retrieve by column name
		     int name1  = rs.getInt("name");
		     int email_id = rs.getInt("email_id");
		     String product_detail = rs.getString("product_detail");
		     String location = rs.getString("location");

		     //Display values
		     System.out.print("name: " + name);
		     System.out.print(", email_id: " + email_id);
		     System.out.print(", product_detail: " + product_detail);
		     System.out.println(", location: " + location);
		  }
		  rs.close();
	}

	@Override
	public String addProductQuestion(String id, String question, String answer)
			throws ClassNotFoundException, SQLException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "ADMIN",
					"admin123");
			
			String sql = "INSERT INTO question (QUESTION_ID, NUMBER_QUESTION, QUESTION, ANSWER) VALUES (?, TssSeq.nextVal, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1,id);
			statement.setString(2,question);
			statement.setString(3,answer);		
			
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println("A new Product Question was added");
			}
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public String addEnvironmentQuestion(String id, String question, String answer)
			throws IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "ADMIN",
					"admin123");
			
			String sql = "INSERT INTO envquestion (ENV_QUESTION_ID, ENV_NUMBER_QUESTION, ENV_QUESTION, ANSWER) VALUES (?, TssSeq.nextVal, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1,id);
			statement.setString(2,question);
			statement.setString(3,answer);		
			
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println("A new Environment Question was added");
			}
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public String deleteProductQuestion(String question) throws IOException {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "ADMIN",
					"admin123");
			
			String sql = "DELETE FROM question WHERE question=?";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1,question);
			statement.executeUpdate();
				System.out.println("A product question has been deleted.");				
		}
		catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public String deleteEnvironmentQuestion(String question) throws IOException {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "ADMIN",
					"admin123");
			
			String sql = "DELETE FROM envquestion WHERE env_question=?";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1,question);
			statement.executeUpdate();
				System.out.println("A product question has been deleted.");				
		}
		catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean validate(String name, String pass) throws IOException {
		boolean status=false;  
		try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "ADMIN",
					"admin123");
		      
		PreparedStatement ps=connection.prepareStatement(  
		"select * from userreg where name=? and pass=?");  
		ps.setString(1,name);  
		ps.setString(2,pass);  
		      
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		          
		}catch(Exception e){System.out.println(e);}  
		return status;  
	}

	
	

}
