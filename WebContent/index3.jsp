
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<title>JSP Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body background="imagens/conference-room-768441_1920.jpg">


	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="home.html"><a href="home.html"
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
			<h1 style="text-align: center;">Chat de Atendimento<br></h1>
	</center>
	<hr>
</font>


<form action="Ingreso" method="post">
    <table style="margin: auto">
        <tr>
            <td><font color="white">Nome</font></td>
            <td>
                <input type="text" name="nick" value="Atendente" readonly="true"/>
            </td>
        </tr>



				<a class="btn btn-primary" href="ListarSemana.jsp" > Semana </a>
        <a class="btn btn-primary" href="ListarDia.jsp" > Dia </a>
		<a class="btn btn-primary" href="ListarMes.jsp"> Mes</a>
		<tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <input type="submit" value="Enviar Dados"/>
            </td>
        </tr>
    </table>
</form>

	
	<a name="ancora"></a>
	<a name="minhaancora"></a>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>



</body>
</html>


