
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
<title>Resgistro de Titulos e Documentos</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body background="img/books.jpg">


	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand p1" href="home.html">Cartório</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="page-scroll">
                        <a href="home.html">Página Inicial</a>
                    </li>   
                </ul>
            </div>
        </div>
    </nav>
	<center>
		<font color="white"><h3>
				Registro de Titulos e Documentos<br> </font>

		</h3>
	</center>
	<hr>



	<form action="controller.do" method="post">

		<div class="row">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								
								
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<textarea class="form-control" name="txtMessage" rows="20" cols="70">																									
		O Cartório de Registro de Títulos e Documentos possui a atribuição de registrar documentos diversos, além de possuir a função de praticar registros de atos não atribuídos às demais naturezas de cartórios extrajudiciais: Cartório de Registro de Imóveis, Cartório de Registro Civil, Cartório de Notas, Cartório de Protesto, Cartório Distribuidor de Protesto.
São executados atos de registrar:
- Instrumentos particulares, para a prova das obrigações convencionais de qualquer valor;
- Penhor comum sobre coisas móveis;
- Caução de títulos de crédito pessoal e da dívida pública federal, estadual ou municipal, ou de Bolsa ao portador;
- Contrato de parceria agrícola ou pecuária;
- Mandado judicial de renovação do contrato de arrendamento para sua vigência quer entre as partes contratantes, quer em face de terceiros;
- Notificações extrajudiciais;
- Quaisquer documentos para sua conservação;
- Cartas de fiança;
- Quitações e recibos;
- Atos administrativos expedidos para cumprimento de decisões judiciais;
- Contratos em geral;
- Expedição de certidões relativa aos atos registrados;

         </textarea>
							</div>
						</div>
						<div id="success">
							<center>
								<div class="row">

									<div class="form-group col-xs-12">
										<button type="submit" name="command" 
											class="btn btn-success btn-lg"><a href="home.html">Voltar</a></button>
									</div>

								</div>
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>


	</form>

		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>