package org.senai.Pascoa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.senai.pascoa.modelo.gerenciarPedidos;

@WebServlet(name = "servletPainel", urlPatterns = "/servletPainel")
public class ServletPainel extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String status = request.getParameter("status");
		String local = request.getParameter("local");
		String inicioprevisto = request.getParameter("inicioprevisto");
		String iniciocirurgia = request.getParameter("iniciocirurgia");
		String fimcirugia = request.getParameter("fimcirugia");
		String saidaprevista = request.getParameter("saidaprevista");
		System.out.println("\n Nome digitado " + nome + " \n Status " + status + " \n Local: " + local + " \n Início Previsto "
				+ inicioprevisto + " \n Início Cirurgia " + iniciocirurgia + " \n Fim Cirurgia " + fimcirugia
				+ " \n Saída Prevista " + saidaprevista);

		Painel obj = new Painel();
		obj.setNomePaciente(nome);
		obj.setStatus(status);
		obj.setLocal(request.getParameter("local"));
		obj.setIniPrevisto(request.getParameter("inicioprevisto"));
		obj.setIniCirurgia(request.getParameter("iniciocirurgia"));
		obj.setFimCirurgia(request.getParameter("fimcirugia"));
		obj.setSaidaPrevista(request.getParameter("saidaprevista"));
		
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