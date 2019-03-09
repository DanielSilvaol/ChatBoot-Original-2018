<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

 <title>Login Funcionario</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
</head>
<body background="imagens/background-2846221_1920.jpg">
	
					
              

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
    
    <section id="contactjh">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center" style="margin-top: 66px">
					<font color="white">
						<h2>Funcionario</h2>
					</font>
					<form action="controller.do" method="post">
						<hr class="star-primary">
				</div>
			</div>
			<div class="container">
				<div class="card card-container">
					<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
					<img id="profile-img" class="profile-img-card"
						src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
					<p id="profile-name" class="profile-name-card"></p>
					<form class="form-signin">
						<span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail"  name="username"  class="form-control" placeholder="Email" required autofocus>
                
                <input type="password" name="passwd" id="passwd" class="form-control" placeholder="Senha" required>
						<div id="remember" class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								Salvar
							</label>
						</div>
						<button class="btn btn-lg btn-primary btn-block btn-signin"
							type="submit" name="command" value="VerificarFuncionario">Enviar</button>
					</form>
					<!-- /form -->
					<a href="index.html" class="forgot-password"> Cliente
					</a>
				</div>
				<!-- /card-container -->
			</div>

			<!-- /container -->

		</div>

	</section>
    

	
		
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
