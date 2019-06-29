  
package org.senai.pascoa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Pascoa {

	private int cod;
	private String nomeCompleto;
	private String email;
	private String telefone;
	private String endereco;
	private String cep;
	private String valor;
	private String ovos;
	private String entregue;
	private String data;
	


	public Pascoa(){
		setNomeCompleto("");
		setEmail("");
		setTelefone("");
		setEndereco("");
		setCep("");
		setValor("");
		setOvos("");
		setEntregue("");
		setData("");
		}
		
		public int getCod() {
			return cod;
		}

		public void setCod(int cod) {
			this.cod = cod;
		}

		public String getNomeCompleto() {
			return nomeCompleto;
		}

		public void setNomeCompleto(String nomeCompleto) {
			this.nomeCompleto = nomeCompleto;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		public String getTelefone() {
			return telefone;
		}

		public void setTelefone(String telefone) {
			this.telefone = telefone;
		}
		public String getEndereco() {
			return endereco;
		}

		public void setEndereco(String endereco) {
			this.endereco = endereco;
		}
		public String getCep() {
			return cep;
		}

		public void setCep(String cep) {
			this.cep = cep;
		}
		
		public String getValor() {
			return valor;
		}

		public void setValor(String valor) {
			this.valor = valor;
		}
		
		public String getOvos() {
			return ovos;
		}

		public void setOvos(String ovos) {
			this.ovos = ovos;
		}
		

		public String getEntregue() {
			return entregue;
		}

		public void setEntregue(String entregue) {
			this.entregue = entregue;
		}
		
		public String getData() {
			return data;
		}

		public void setData(String data) {
			this.data = data;
		}
	public boolean apagar() {

		Connection conexao = new ConectarBD().getConectar();
		
		if(conexao != null) {
			String sql = "delete from pascoa where cod = ? ";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
						prepararSQL.setInt(1, cod);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return false;
	}
	// copiamos o código inserir pra reaproveitar o codigo e
	// fazer o método atualizar
	public boolean atualizar() {

		Connection conexao = new ConectarBD().getConectar();
		
		if(conexao != null) {
			String sql = "update pascoa set " + 
					"	nome_completo  = ? ," + 
					"	email     	   = ? ," + 
					"	telefone       = ? ," + 
					"	endereco       = ? ," + 
					"	cep            = ? ," +
					" 	valor		   = ? ," +
					" where cod        = ? ";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1, nomeCompleto);
				prepararSQL.setString(2, email);
				prepararSQL.setString(3, telefone);
				prepararSQL.setString(4, endereco);
				prepararSQL.setString(5, cep);
				prepararSQL.setString(6, valor);
				prepararSQL.setString(7, ovos);
				prepararSQL.setInt(8, cod);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return false;
	}

	public boolean inserir() {

		Connection conexao = new ConectarBD().getConectar();
		
		if(conexao != null) {
			String sql = "insert into pascoa(" + 
					"	nome_completo  ," + 
					"	email     	   ," + 
					"	telefone       ," + 
					"	endereco       ," +
					"	cep       	   ," +
					"	valor      	   ," +
					"	ovos      	   ," +
					"	data          )" +
					
					"values (?," + 
					"		?," + 
					"		?," + 
					"		?," + 
					"		?," +
					"		?," +
					"		?," +
					"		?)"; 
					
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1, nomeCompleto);
				prepararSQL.setString(2, email);
				prepararSQL.setString(3, telefone);
				prepararSQL.setString(4, endereco);
				prepararSQL.setString(5, cep);
				prepararSQL.setString(6, valor);
				prepararSQL.setString(7, ovos);
				prepararSQL.setString(8, data);
				
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return false;
	}
	
	public List<Pascoa> getLista(String historico){		
		try {
			Connection conexao = new ConectarBD().getConectar();
			PreparedStatement ps = 					
					conexao.prepareStatement("select * from pascoa where entregue is "+historico+" null order by nome_completo");			
			ResultSet rs = ps.executeQuery();
			
			List<Pascoa> lsPascoa = new ArrayList<Pascoa>();
			
			while (rs.next()) {
				Pascoa p = new Pascoa();
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCod(rs.getInt("cod"));
				p.setNomeCompleto(rs.getString("nome_completo"));
				p.setEmail(rs.getString("email"));
				p.setTelefone(rs.getString("telefone"));
				p.setEndereco(rs.getString("endereco"));
				p.setCep(rs.getString("cep"));
				p.setValor(rs.getString("valor"));
				p.setOvos(rs.getString("ovos"));
				p.setEntregue(rs.getString("entregue"));
				p.setData(rs.getString("data"));
				lsPascoa.add(p);
			}
			ps.close();
			conexao.close();
			return lsPascoa;
		} catch (Exception e) {

		}		
		return null;
	}
	
	
	public Pascoa getPascoa(int cod){		
		try {
			Connection conexao = new ConectarBD().getConectar();
			PreparedStatement ps = 					
					conexao.prepareStatement(
							"select * from pascoa where cod = ? ");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			
			Pascoa p = new Pascoa();
			while (rs.next()) {
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCod(rs.getInt("cod"));
				p.setNomeCompleto(rs.getString("nome_completo"));
				p.setEmail(rs.getString("email"));
				p.setTelefone(rs.getString("telefone"));
				p.setEndereco(rs.getString("endereco"));
				p.setCep(rs.getString("cep"));
				p.setValor(rs.getString("valor"));
				p.setOvos(rs.getString("ovos"));
				p.setData(rs.getString("data"));
			}
			ps.close();
			conexao.close();
			return p;
		} catch (Exception e) {

		}		
		return null;
	}
	
		
	
	public boolean concluir(int cod) {

		Connection conexao = new ConectarBD().getConectar();
		
		if(conexao != null) {
			String sql = "update pascoa set " + 
					"	entregue  = 'sim' "+
					" where cod        = ? ";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setInt(1, cod);
				
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return false;
	}	
	
}
