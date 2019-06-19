package org.senai.pascoa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.senai.pascoa.modelo.Pascoa;

@WebServlet(name = "servletPascoa", urlPatterns = "/servletPascoa")
public class ServletPascoa extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		String endereco = request.getParameter("endereco");
		String cep = request.getParameter("cep");
		
		

		Pascoa obj = new Pascoa();
		obj.setNomeCompleto(nome);
		obj.setEmail(email);
		obj.setTelefone(telefone);
		obj.setEndereco(endereco);
		obj.setCep(cep);
		
		
		boolean sucesso = false;
		sucesso = obj.inserir();
		
		
		
		PrintWriter saida = response.getWriter();
		
		int cod = Integer.parseInt(request.getParameter("cod"));
		
		
		if(cod > 0) {
			obj.setCod(cod);
			if(request.getParameter("apagar") == null){
				sucesso = obj.atualizar();
			}else {
				sucesso = obj.apagar();
			}
						
		}else {
			sucesso = obj.inserir();
		}
		
		if (sucesso) {
			saida.print("Gravado com sucesso");
		}else {
			saida.print("Erro ao Gravar");
		}

		
		
	}
}