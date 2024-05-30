package com.ConnectionFactory;

import java.sql.Connection;

import com.mysql.cj.jdbc.MysqlDataSource;

public class ConnectionFactory {
	
	public static Connection con;
	
	public static Connection getCon()
	{
		try
		{
			MysqlDataSource ds= new MysqlDataSource();
			ds.setUrl("jdbc:mysql://localhost:3306/bank");
			ds.setUser("root");
			ds.setPassword("");
			
			con=ds.getConnection();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			return con;
		}
	}

}
