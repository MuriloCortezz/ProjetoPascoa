<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.senai.cntrCirurgico.modelo.Painel"%>
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
</head>
<body>

	<div>
		<img
			src="http://www.df.gov.br/wp-conteudo/uploads/2015/10/Bandeira_do_Distrito_Federal_Brasil.png"
			height="80" width="120"> Hospital Regional de
		Taguatinga|Secretaria de Estado de Sa�de do Distrito Federal|
		Pacientes no centro cirurgico
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="25%">Nome Completo/th>
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
					Painel painel = new Painel();

					for (Painel p : painel.getLista()) {
						out.print("<tr onclick='prepararEditar("+p.getCod()+")'>");
						//out.print("<td>"+p.getCod()+"</td>");
						out.println("<td>" + p.getNomeCompleto() + "</td>");
						//out.print("<td class='" + p.getCorStatus() + "'>" + p.getStatus() + "</td>");
						out.print("<td>" + p.getEndereço() + "</td>");
						out.print("<td>" + p.getEmail() + "</td>");
						out.print("<tr>");

					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
