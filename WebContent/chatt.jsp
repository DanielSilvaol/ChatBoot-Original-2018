<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="pacote.SessaoUsuario"%> 
<%	SessaoUsuario sesseao = new SessaoUsuario();
 	String sala = (String) application.getAttribute("sala");
 %> 
 <%
 	response.setIntHeader("Reflesh", 5);
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<title>Chat Atendimento</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/jquery.mCustomScrollbar.css" rel="stylesheet">
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		location.hash = "#ancora";
	}	
</script>
<script type="text/javascript">
	function load() {
		document.getElementById("msg").focus();
	}
</script>


</head>
<body onload="load()" background="img/books.jpg">


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
	
	<center>
		<font color="white"><h3>
				Bem-Vindo ao Chat de Atendimento</h3></font>		
	</center>
	<hr>
<form action="Chatt" method="post">

		<div class="row">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form name="sentMessage" id="contactForm" novalidate>
					
						<div class="row control-group">
							<div
								class="form-group col-xs-10 floating-label-form-group controls">
								<font color="white"> </font>
						
								<input type="text" id="msg" class="form-control" placeholder="Faça sua pergunta" name="msg" style="
    margin-top: 29px;">
																		

							</div>
							<div class="row">
							<div class="form-group col-xs-2">
									<button type="submit" name="command" style="margin-top:29px;margin-left:-7px;"value="Enviar" class="btn btn-success md- scroll">Enviar</button>
									<a href="#minhaancora"></a>
								</div>							 
						
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<div id="sala" align="justify" type="text" name="msg" id="msg" class="container" style="overflow: auto; width: 945px; height: 300px; background-color: white; font-family: monospace; margin-right: 75%; border-radius: 10px; padding-bottom: 10px">
									<%=sala%>	
									
									<a name="ancora"></a> <a name="minhaancora"></a>								
									
								</div>
							</div>
							<div id="success">
							
							
							
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		</form>
<form action="controller.do" method="post">
								<center><button type="submit" name="Command" value="Finalizar">Sair da conversa</button></center>
							</form>

	<a name="ancora"></a>
	<a name="minhaancora"></a>
	


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>



</body>
</html>
