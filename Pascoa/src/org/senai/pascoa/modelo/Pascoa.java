  
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

	
	
	public Pascoa(){
		setNomeCompleto("");
		setEmail("");
		setTelefone("");
		setEndereco("");
		setCep("");
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


	public boolean apagar() {

		Connection conexao = new ConectarBD().getConectar();
		
		if(conexao != null) {
			String sql = "delete from painel where cod = ? ";
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
			String sql = "update painel set " + 
					"	nome_completo  = ? ," + 
					"	email     	   = ? ," + 
					"	telefone       = ? ," + 
					"	endereco       = ? ," + 
					"	cep            = ? ," + 
					" where cod        = ? ";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1, nomeCompleto);
				prepararSQL.setString(2, email);
				prepararSQL.setString(3, telefone);
				prepararSQL.setString(4, endereco);
				prepararSQL.setString(5, cep);
				prepararSQL.setInt(6, cod);
				
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
			String sql = "insert into painel(" + 
					"	nome_completo  ," + 
					"	email          ," + 
					"	telefone       ," + 
					"	endereco       ," + 
					"	cep            )" + 
					
					"values (?," + 
					"		?," + 
					"		?," + 
					"		?," + 
					"		?," +  
					"		)";
			try {
				PreparedStatement prepararSQL =
						conexao.prepareStatement(sql);
				prepararSQL.setString(1, nomeCompleto);
				prepararSQL.setString(2, email);
				prepararSQL.setString(3, telefone);
				prepararSQL.setString(4, endereco);
				prepararSQL.setString(5, cep);
				
				
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
	
	public List<Pascoa> getLista(){		
		try {
			Connection conexao = new ConectarBD().getConectar();
			PreparedStatement ps = 					
					conexao.prepareStatement("select * from painel");
			ResultSet rs = ps.executeQuery();
			
			List<Pascoa> lsPainel = new ArrayList<Pascoa>();
			
			while (rs.next()) {
				Pascoa p = new Pascoa();
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCod(rs.getInt("cod"));
				p.setNomeCompleto(rs.getString("nome_paciente"));
				p.setEmail(rs.getString("status"));
				p.setTelefone(rs.getString("local"));
				p.setEndereco(rs.getString("ini_previsto"));
				p.setCep(rs.getString("ini_cirurgia"));
				lsPainel.add(p);
			}
			ps.close();
			conexao.close();
			return lsPainel;
		} catch (Exception e) {

		}		
		return null;
	}
	
	
	public Pascoa getPainel(int cod){		
		try {
			Connection conexao = new ConectarBD().getConectar();
			PreparedStatement ps = 					
					conexao.prepareStatement(
							"select * from painel where cod = ? ");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			
			Pascoa p = new Pascoa();
			while (rs.next()) {
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCod(rs.getInt("cod"));
				p.setNomePaciente(rs.getString("nome_paciente"));
				p.setStatus(rs.getString("status"));
				p.setLocal(rs.getString("local"));
				p.setIniPrevisto(rs.getString("ini_previsto"));
				p.setIniCirurgia(rs.getString("ini_cirurgia"));
				p.setFimCirurgia(rs.getString("fim_cirurgia"));
				p.setSaidaPrevista(rs.getString("saida_prevista"));
			}
			ps.close();
			conexao.close();
			return p;
		} catch (Exception e) {

		}		
		return null;
	}
	
	public String getCorStatus() {
			
		if(status.equals("Pré-Operatório")) {
			return "table-warning";
		}

		if(status.equals("Em Sala Cirúrgica")) {
			return "table-danger";
		}		
		
		if(status.equals("Em Recuperação")) {
			return "table-success";
		}

		if(status.equals("Transferido")) {
			return "table-primary";
		}
		
		return "";
	}

	
	
	
	
}
