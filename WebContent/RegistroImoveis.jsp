
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
<title>Resgistro de Imoveis</title>
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
				Registro de Imoveis<br> </font>

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
		Passada a fase de busca, possíveis financiamentos, verificação de disponibilidade e elaboração de contratos iniciais, é chegada a hora de formalizar o negócio de compra e venda firmado, afinal, só é dono aquele que registra o bem.
		O registro do negócio na matrícula do imóvel (aquele documento que registra todos os eventos e mudanças ocorridas em torno de sua propriedade ou posse) é feito no respectivo Cartório de Imóveis, sendo o principal instrumento apto a comprovar juridicamente que quem é o dono de um bem imóvel.

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