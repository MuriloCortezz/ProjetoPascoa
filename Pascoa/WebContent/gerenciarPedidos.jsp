<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.senai.pascoa.modelo.Pascoa"%>
<html lang="pt">

<head>
<title>Painel de Pedidos</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div>
<center style="background-image: url("ovobg.jpg");">
<img src ="img/logo.png"/>
</center>
</div>
	<div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="25%">Nome Completo</th>
					<th width="20%">Endereço</th>
					<th width="20%">E-mail</th>
				</tr>
			</thead>

<script>

function prepararEditar(cod){
	//alert("editar"+cod)
	window.location.replace('pedidos.jsp?cod='+cod);
}

</script>


			<tbody>
				<%
					Pascoa pascoa = new Pascoa();

					for (Pascoa p : pascoa.getLista()) {
						out.println("<tr onclick='prepararEditar("+p.getCod()+")'>");
						out.println("<td>" + p.getNomeCompleto() + "</td>");
						out.print("<td>" + p.getEndereco() + "</td>");
						out.print("<td>" + p.getEmail() + "</td>");
						out.print("<tr>");

					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
