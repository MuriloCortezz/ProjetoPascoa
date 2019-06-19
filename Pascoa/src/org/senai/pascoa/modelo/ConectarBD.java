package org.senai.pascoa.modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectarBD {

	public Connection getConectar() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/pedidos_pascoa", "root", "");
			
		} catch (Exception e) {
			System.out.println("erro de conexão");
			return null;
		}
		
	}
}
