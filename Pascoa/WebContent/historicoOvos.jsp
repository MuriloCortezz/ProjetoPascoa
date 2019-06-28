<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.senai.pascoa.modelo.Pascoa"%>
<html lang="pt">

<head>
<title>Painel de Pedidos</title>
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
<link rel="stylesheet" href="css/style5.css">
</head>
<body>

	<div>
		<div>
			<img class="fundo" src="img/ovobg.jpg" />


			<center>
				<div>
					<img class="logo" src="img/logo1.png" />
				</div>
			</center>
		</div>


		<script type="text/javascript">
			function concluir(cod) {

				if (confirm("Realmente deseja marcar como concluido esse pedido?")) {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							// Typical action to be performed when the document is ready:

							var msg = xhttp.responseText;
							if (msg == "ok") {
								window.location.replace('gerenciarPedidos.jsp');

							}
						}
					}
				}
				;
				xhttp.open("GET", "servletPascoa?&concluir=" + cod, true);
				xhttp.send();
			}
		</script>

		<div class=body>
			<table class="table table-striped">
				<thead>
					<tr>
						<th width="7%">Nome Completo</th>
						<th width="5%">Valor</th>
						<th width="5%">Ovos</th>
						<th width="5%">Datas</th>


					</tr>
				</thead>

				<script>
					function prepararEditar(cod) {
						//alert("editar"+cod)
						window.location.replace('pedidos.jsp?cod=' + cod);
					}
				</script>


				<tbody>
					<%
						Pascoa pascoa = new Pascoa();

						for (Pascoa p : pascoa.getLista()) {
							out.println("<tr>");
							out.println("<td>" + p.getNomeCompleto() + "</td>");
							out.print("<td>" + p.getValor() + "</td>");
							out.print("<td>" + p.getOvos() + "</td>");
							out.print("<td <button type='button' class='btn btn-danger' onclick='concluir(" + p.getCod()
									+ ")'>Concluir</button> </td>");
							out.print("</tr>");

						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
