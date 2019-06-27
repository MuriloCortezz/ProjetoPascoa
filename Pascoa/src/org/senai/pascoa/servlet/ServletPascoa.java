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
		String valor = request.getParameter("valor");
		String listaOpcaoOvos[] = 
			{"chocolate-350g",
			 "chocolate-250g",
			 "chocolate-500g",
			 "coco-250g",
			 "coco-350g",
			 "coco-500g",
			 "Maracuja-250g",
			 "Maracuja-350g",
			 "Maracuja-350g",
			 "Maracuja-500g",
			 "Mousse-250g",
			 "Mousse-350g",
			 "Mousse-500g",
			 "Pmel-250g",
			 "Pmel-350g",
			 "Pmel-500g"};
		
		String ovos = "";
		// testas quais chocolates foram escolhidos.		
		for (String opcOvo : listaOpcaoOvos) {
			String ovo = request.getParameter(opcOvo);
			if (ovo != null) {
				ovos += opcOvo+" x "+ovo+"<br>";
			}			
		}
		

		Pascoa obj = new Pascoa();
		obj.setNomeCompleto(nome);
		obj.setEmail(email);
		obj.setTelefone(telefone);
		obj.setEndereco(endereco);
		obj.setCep(cep);
		obj.setValor(valor);
		obj.setOvos(ovos);
		
		
		
		
		
		PrintWriter saida = response.getWriter();
		
		int cod = Integer.parseInt(request.getParameter("cod"));
		
		boolean sucesso = false;
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