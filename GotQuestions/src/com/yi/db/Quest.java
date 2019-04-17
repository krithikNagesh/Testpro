package com.yi.db;

import java.io.IOException;
import java.sql.SQLException;

public interface Quest {

	public void selectProduct(String name) throws ClassNotFoundException, SQLException, IOException;
	public String addProductQuestion(String id, String question, String answer) throws ClassNotFoundException, SQLException, IOException;
	public String addEnvironmentQuestion(String id, String question, String answer) throws IOException;
	public String deleteProductQuestion(String question)throws IOException;
	public String deleteEnvironmentQuestion(String question)throws IOException;
	public boolean validate(String name,String pass)throws IOException;
}
