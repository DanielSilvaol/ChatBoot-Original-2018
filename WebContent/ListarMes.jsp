<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="fusioncharts.FusionCharts"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.*" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Clientes</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body  background="imagens/time-2980690_1920.jpg">


	<div id="main" class="container">
		<form action="controller.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>Dados Cliente</h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="data[search]" class="form-control" id="search"
							type="text"
							placeholder="Pesquisar Clientes (deixe vazio para trazer todos)">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="submit" name="command"
								value="FuncBusca2">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
				<a class="btn btn-primary" href="ListarSemana.jsp" style="
    margin-top: 20px;
"> Semana </a>
				<a class="btn btn-primary" href="ListarDia.jsp" style="
    margin-top: 20px;
"> Dia </a>


					<a href="home.html" class="btn btn-primary pull-right h2"> home</a>

			</div>
			<!-- /#top -->
		</form>
		<hr />
		<c:if test="${not empty lista}">
			<div id="list" class="row">

				<div class="table-responsive col-md-12"
					style="background-color: white">
					<table class="table table-striped" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Qtd1</th>
								<th>Qtd2</th>
								<th>Qtd3</th>
								<th>QtdHumanas</th>
								<th>Duração</th>
								<th>Data</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="semana" items="${lista}">
								<tr>
									<td>${semana.codigoDoAtendimento}</td>
									<td>${semana.nomeDoCliente}</td>
									<td>${semana.quantidadeDeTentativas}</td>
									<td>${semana.quantidadeDeTentativas2}</td>
									<td>${semana.quantidadeDeTentativas3}</td>
									<td>${semana.quantidadeDeTentativashumanas}</td>
									<td>${semana.duracaoDoAtendimento}</td>
									<td>${semana.data}</td>

								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			
					
			<!-- /#list -->

			<div id="bottom" class="row">
				<div class="col-md-12" style="text-align: center;">
					<!-- paginação ainda não foi implementada -->
					<ul class="pagination">
						<li class="disabled"><a>&lt; Anterior</a></li>
						<li class="disabled"><a>1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
					</ul>
					<!-- /.pagination -->
				</div>
			</div>
		</c:if>
		<!-- /#bottom -->
	</div>
	<!-- /#main -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#delete-modal").on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); //botao que disparou a modal
			var recipient = button.data('pais');
			$("#id_excluir").val(recipient);
		});
	</script>
</body>

</html>