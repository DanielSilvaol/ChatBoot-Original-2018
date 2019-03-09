<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.ChatBDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<title>ChatBot</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/jquery.mCustomScrollbar.css" rel="stylesheet">
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		location.hash = "#ancora";
	}
</script>



</head>
<body background="img/books.jpg">



	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Cartorio de SP</h4>
				</div>
				<div class="modal-body">
					<p>Gostaria de guardar a conversa?</p>
				</div>
				<div class="modal-footer">
					<form name="chatBController.do" action="controller.do" method="post">
					<button type="submit" name="command" value="GerarPdf" class="btn btn-primary" style="float: left;">Enviar
						conversa por E-mail
						</button></form>
						 <a href="home.html" type="button"
						class="btn btn-default" style="float: left; margin-left: 10px;">Voltar a Home</a>
				</div>
			</div>

		</div>
	</div>

	</div>

	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="home.html"><a href="#menu-toggle"
					class="btn btn-secondary p1" id="menu-toggle">Cartório</a></a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="page-scroll"><a href="index.html">Cadastrar-se</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<h6>

		id := ${cliente.id }<br> Nome: = ${cliente.nome }<br> email:
		= ${cliente.email }<br>
	</h6>
	<center>
		<h3>
			<font color="white"> Bem-Vindo ao Chat Boot<br>
				${cliente.nome }<br></font>



		</h3>
	</center>
	<hr>



	<form name="chatBController.do" action="controller.do" method="post">

		<div class="row">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-10 floating-label-form-group controls">
								<font color="white"> </font> <input type="text" id="pergunta"
									class="form-control" placeholder="Faça sua pergunta"
									name="pergunta">

							</div>
							<div class="row">

								<div class="form-group col-xs-2">
									<button type="submit" name="command" value="ChatBot"
										class="btn btn-success md- scroll">Enviar</button>
									<a href="#minhaancora"></a>
								</div>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<div class="container"
									style="overflow: auto; width: 846px; height: 300px; background-color: white; font-family: monospace; margin-right: 75%; border-radius: 10px; padding-bottom: 10px">
									<fieldset>


										<legend style="text-align: center; width: 96%;">ChatBot</legend>
										<c:forEach var="conversa" items="${chat.conversas}">
											<div class="cliente" id="clientea"
												style="text-align: left; margin-right: 60%; color: cadetblue">
												${cliente.nome} : ${conversa.pergunta}.</div>
											<div class="bot"
												style="text-align: left; margin-left: 50%; color: black">
												Bot : ${conversa.resposta}. <br />
												<c:if
													test="${ conversa.resposta ne 'Desculpe, mas não tenho a resposta para sua pergunta! Você pode reformular a sua pergunta?'}">

													<div Style="color: aqua">te ajudei com essa resposta?
													</div>


													<button type="button" onclick="myFunction()"  data-toggle="modal"
														data-target="#myModal"
														style="border: 1px solid #999; padding: 1px 3px 2px 3px;">S</button>

													<button onclick="Pesquisa()" type="submit" name="command"
														value="ValidarResposta" class="btnN btn default btn-xs">N</button>
													<p id="yes"></p>
													<p id="saber"></p>
													<script>
														function myFunction() {
															document
																	.getElementById("yes").innerHTML = "Obrigado. ";

														}
														function Pesquisa() {
															var contCLick = 0;
															contClick++;
															if (contCLick == 1) {
																var contClick1 = 0;
																contClick1++;
																//ta dando errado
																document
																		.getElementById("saber").innerHTML = value(contClick1);
															}

														}
													</script>
												</c:if>

												<c:if
													test="${ conversa.resposta eq 'vamos te passar para um atendente' }">
													<button type="submit" name="command"
														value="ContarTentativas">Clique aqui para falar
														com atendente</button>


												</c:if>
											</div>
										</c:forEach>
										<a name="ancora"></a> <a name="minhaancora"></a>
									</fieldset>
								</div>
							</div>
							<div id="success">
								<center></center>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</form>
	<a name="ancora"></a>
	<a name="minhaancora"></a>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>



</body>
</html>