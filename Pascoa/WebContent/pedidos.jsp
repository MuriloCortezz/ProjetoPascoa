<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.senai.pascoa.modelo.Pascoa"%>
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
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Ovo de Páscoa</title>
<style>
body {
	text-aling: center;
}

.fundo {
	position: relative;
	position: absolute;
	height: 210%;
	opacity: 0.5;
	width: 100%;
}
</style>

</head>

<body>
	<script type="text/javascript">
		var listaOvos = [];

		var valorTotal = 0;

		
		function calcularValor(ovo){
			// fazer um teste do tamanho 
			// colocar dentro de uma function
			var valorUnitario = 0;
			var tamanho = ovo.id.split('-');
			if (tamanho[1] == '250g') {
				valorUnitario = 25;
			}
			if (tamanho[1] == '350g') {
				valorUnitario = 30;
			}
			if (tamanho[1] == '500g') {
				valorUnitario = 50;
			}
			// aqui é onde o calculo é feito
			return valorUnitario*ovo.value;
		}
		
		function escolhidos(ovo) {
			valorTotal = 0;
			var qt = listaOvos.length;

			for (lstOvos in listaOvos) {
				if (listaOvos[lstOvos].id == ovo.id) {
					qt = lstOvos;
				}
			}

			listaOvos[qt] = ovo;

			for (lstOvos in listaOvos) {
				if (listaOvos[lstOvos].value > 0) {
					// aqui vamos chamar o método para fazer o calculo apenas dos que tem quantidade maior que 0
					valorTotal += calcularValor(listaOvos[lstOvos]);					
				}
			}
			// colocar na tema esse valor total
			alert('valor total'+valorTotal);
			
		}

		function dadosForm() {

			var dados = "";

			dados += "nome=" + document.getElementById("nome").value;
			dados += "&email=" + document.getElementById("email").value;
			dados += "&telefone=" + document.getElementById("telefone").value;
			dados += "&endereco=" + document.getElementById("endereco").value;
			dados += "&cep=" + document.getElementById("cep").value;
			dados += "&valor=" +valorTotal;
			dados += "&cod=" + document.getElementById("cod").value;
			
			var ovosEscolhidos = "";
			for (lstOvos in listaOvos) {
				if (listaOvos[lstOvos].value > 0) {
					alert(listaOvos[lstOvos].id);
					ovosEscolhidos += "&" + listaOvos[lstOvos].id + "="
							+ listaOvos[lstOvos].value;
				}
			}
			dados += ovosEscolhidos;

			alert(dados);

			return dados;
		}

		function gravar() {
			//dadosForm();

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var msg = xhttp.responseText;
					document.getElementById("msg").innerHTML = msg;
					if (msg == "Gravado com sucesso") {
						document.getElementById("msg").className = "alert alert-info";
					} else {
						document.getElementById("msg").className = "alert alert-danger";
					}
				}
			};
			xhttp.open("GET", "servletPascoa?" + dadosForm(), true);
			xhttp.send();
		}
		function apagar() {
			if (confirm("Realmente deseja apagar esse registro??")) {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						var msg = xhttp.responseText;

						if (msg == "Gravado com sucesso") {
							document.getElementById("msg").className = "alert alert-info";
							document.getElementById("msg").innerHTML = "Informação apagada";
							document.getElementById("formulario").reset();
						} else {
							document.getElementById("msg").className = "alert alert-danger";
							document.getElementById("msg").innerHTML = "Erro ao apagar";
						}
					}
				};
				xhttp.open("GET", "ServletPascoa?" + dadosForm() + "&apagar",
						true);
				xhttp.send();
			}
			
			
			$('.telefone-mask').mask('(99) 9999-99999');
			$('.telefone-mask').blur(function(event) {
			   if($(this).val().length == 15){ // Celular com 9 dígitos + 2 dígitos DDD e 4 da máscara
			      $(this).mask('(99) 99999-9999');
			   } else {
			      $(this).mask('(99) 9999-99999');
			   }
			});
			
		}
			
			

	</script>

	<%
		Pascoa pascoa = new Pascoa();

		if (request.getParameter("cod") != null) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			pascoa = pascoa.getPascoa(cod);
		}
	%>

	<div>
		<img class="fundo" src="img/ovobg1.jpg" />
	</div>
	<div class=body>
		<nav class="navbar navbar-expand-sm "
			style="background-color: #D2691E; color: White;">
			<div><h2>Bem-vindo ao nosso site de Óvos de Páscoa.</h2>
			<form></form>
		</div>
		</nav>
		<div class="container">
			<h2>Preencha seus dados</h2>
			<form id="formulario">
				<input type="hidden" value="<%out.print(pascoa.getCod());%>"
					id="cod" />
				<div id="msg"></div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="nome">Nome completo</label> <input type="text"
							class="form-control" id="nome"
							value="<%out.print(pascoa.getNomeCompleto());%>"
							placeholder="Nome completo">
					</div>
					<div class="form-group col-md-4">
						<label for="email">E-mail</label> <input type="text"
							class="form-control" id="email"
							value="<%out.print(pascoa.getEmail());%>" placeholder="E-mail">
					</div>

					
					<div class="form-group col-md-2">
						<label for="telefone">Telefone</label> <input type="tel" name="telefone" 
							class="form-control" id="telefone" maxlength="12"
							value="<%out.print(pascoa.getTelefone());%>"
							placeholder="(##)####-####"  >
							<script>$("#telefone").mask("(99) 9999-99999");</script>
							
							
							
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-10">
						<label for="Endereço">Endereço</label> <input type="text"
							class="form-control" id="endereco"
							value="<%out.print(pascoa.getEndereco());%>"
							placeholder="Endereço">
					</div>
					<div class="form-group col-md-2">
						<label for="cep">CEP</label> <input type="text"
							class="form-control" id="cep" maxlength="9"
							value="<%out.print(pascoa.getCep());%>" placeholder="CEP">
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

										<select class="form-control" id="chocolate-250g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="chocolate-350g"
											onchange="escolhidos(this)">

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
										<select class="form-control" id="chocolate-500g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="coco-250g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="coco-350g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="coco-500g"
											onchange="escolhidos(this)">
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
							<img class="card-img-top" src="img/ovomaracuja.jpg"
								alt="Maracujá">
							<div class="card-body">
								<h6 class="card-title">Ovo de Páscoa - Maracujá</h6>

								<div class="row form-inline ">
									<div class="col-sm-6">250g - R$25,00</div>
									<div class="col-sm-4">
										<select class="form-control" id="Maracuja-250g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Maracuja-350g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Maracuja-500g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Mousse-250g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Mousse-350g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Mousse-500g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Pmel-250g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Pmel-350g"
											onchange="escolhidos(this)">
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
										<select class="form-control" id="Pmel-500g"
											onchange="escolhidos(this)">
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
						<button type="button" class="btn btn-primary" onclick="gravar()">Enviar
							pedido</button>

						<button type="button" class="btn btn-danger" onclick="apagar()">Cancelar</button><br>
						<a href="http://localhost:8080/Pascoa/gerenciarPedidos.jsp" type="button" class="btn btn-info" >Painel de Pedidos</a>
						
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>