<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.senai.cntrCirurgico.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Ovo de Páscoa</title>
<style>
body{

text-aling:center;
}

.fundo{
position: relative;
position:absolute;
height:210%;
opacity: 0.5;
width: 100%;


}
</style>

</head>

<body>
  	<script type="text/javascript">

      function dadosForm() {
        var dados = "";
        
        dados += "nome=" + document.getElementById("nome").value;
        dados += "&email=" + document.getElementById("email").value;
        dados += "&telefone=" + document.getElementById("telefone").value;
        dados += "&endereco=" + document.getElementById("endereco").value;
        dados += "&cep=" + document.getElementById("cep").value;
        dados += "&cod=" + document.getElementById("cod").value;
        
        return dados;
      }
      
      function gravar() {
          
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
               var msg = xhttp.responseText;
               document.getElementById("msg").innerHTML = msg;
               if (msg == "Gravado com sucesso") {
                 document.getElementById("msg").className = "alert alert-info";
          }else{
            document.getElementById("msg").className = "alert alert-danger";
          }
            }
        };	
        xhttp.open("GET", "servletPainel?" + dadosForm(), true);
        xhttp.send();
      }
      function apagar(){
        if(confirm("Realmente deseja apagar esse registro??")){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
               var msg = xhttp.responseText;
               
               if (msg == "Gravado com sucesso") {
                 document.getElementById("msg").className = "alert alert-info";
                 document.getElementById("msg").innerHTML = "Informação apagada";
                 document.getElementById("formulario").reset();
          }else{
            document.getElementById("msg").className = "alert alert-danger";
            document.getElementById("msg").innerHTML = "Erro ao apagar";
          }
            }
        };
        xhttp.open("GET", "servletPainel?" + dadosForm()+"&apagar", true);
        xhttp.send();
        }
      }
      
      
      function novo(){
        
        window.location.replace('gerenciarPainel.jsp');
      }
      </script>
      
        <%
          Painel painel = new Painel();
      
          if (request.getParameter("cod") != null) {
            int cod = Integer.parseInt(request.getParameter("cod"));
            painel = painel.getPainel(cod);
          }
        %>
      
<div >
<img class="fundo"src="img/ovobg1.jpg"/>
</div>
<div class=body>
<nav class="navbar navbar-expand-sm " style="background-color: #D2691E; color:White;">
 <h2>Bem-vindo ao nosso site de Óvos de Páscoa.</h2>
</nav>
	<div class="container">
  <h2>Preencha seus dados</h2>
  <form id = "formulario">
	<input type="hidden" value="<%out.print(painel.getCod());%>" id="cod" />
			<div id="msg"></div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome completo</label> <input type="text"
						class="form-control" id="nome" value="<%out.print(painel.getNomePaciente());%>" placeholder="Nome completo">
				</div>
				<div class="form-group col-md-4">
					<label for="email">E-mail</label> <input type="text"
						class="form-control" id="email" value="<%out.print(painel.getLocal());%>" placeholder="E-mail">
				</div>
				<div class="form-group col-md-2">
					<label for="telefone">Telefone</label> <input type="text"
						class="form-control" id="telefone" value="<%out.print(painel.getLocal());%>" placeholder="(   )_____-____">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-10">
					<label for="endereço">Endereço</label> <input type="text"
						class="form-control" id="endereco" value="<%out.print(painel.getLocal());%>" placeholder="Endereço">
				</div>
				<div class="form-group col-md-2">
					<label for="cep">CEP</label> <input type="text"
						class="form-control" id="cep" value="<%out.print(painel.getLocal());%>" placeholder="CEP">
				</div>
			</div>
<h3>Escolha abaixo:</h3>
			<div class="card-columns">
				<div class="col-sm-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="img/ovomoussechocolate.jpg"
							alt="Chocolate">
						<div class="card-body">
							<h6 class="card-title">Ovo de Páscoa - Chocolate</h6>
							<div class="row form-inline ">
								<div class="col-sm-6">250g - R$25,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">350g - R$30,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">500g - R$50,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="img/ovococo.jpg" alt="Coco">
						<div class="card-body">
							<h6 class="card-title">Ovo de Páscoa - Coco</h6>
							<div class="row form-inline ">
								<div class="col-sm-6">250g - R$25,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">350g - R$30,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">500g - R$50,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="img/ovomaracuja.jpg" alt="Maracujá">
						<div class="card-body">
							<h6 class="card-title">Ovo de Páscoa - Maracujá</h6>

							<div class="row form-inline ">
								<div class="col-sm-6">250g - R$25,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">350g - R$30,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">500g - R$50,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="card-columns">
				<div class="col-sm-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="img/ovomousse.jpg" alt="Mousse">
						<div class="card-body">
							<h6 class="card-title">Ovo de Páscoa - Mousse</h6>
							<div class="row form-inline ">
								<div class="col-sm-6">250g - R$25,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">350g - R$30,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">500g - R$50,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="img/ovopaodemel.jpg"
							alt="Pao de mel">
						<div class="card-body">
							<h6 class="card-title">Ovo de Páscoa - Pão de Mel</h6>

							<div class="row form-inline ">
								<div class="col-sm-6">250g - R$25,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">350g - R$30,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="row form-inline ">
								<div class="col-sm-6">500g - R$50,00</div>
								<div class="col-sm-4">
									<select class="form-control">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class=" card-columns">
				<div class="col">
					<button type="submit" class="btn btn-primary">Enivar
						pedido</button>

					<button type="submit" class="btn btn-danger">Cancelar</button>
				</div>
			</div>
		</form>
	</div>
</div>

</body>

</html>