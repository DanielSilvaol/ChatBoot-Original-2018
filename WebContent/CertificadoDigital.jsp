
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
<title>Certificado Digital</title>
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
				Certificado Digital<br> </font>

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
		O Certificado Digital da ICP-Brasil é sua carteira de identidade no mundo virtual e garante a validade jurídica de todos os negócios e transações que você normalmente necessitaria realizar pessoalmente feitos agora sem sair da frente do seu computador.
		Com segurança garantida pelo ITI e pela ICP-Brasil, o Certificado Digital economiza tempo para que você realize seus negócios tanto no setor público quanto no setor privado com a maior facilidade, sem burocracia, sem a necessidade de deslocamentos e diminuindo, além dos custos, a quantidade de papel gerado em suas transações.
		Para os advogados, contadores e corretores, o Certificado Digital valida sua presença virtual pelo registro nos órgãos regulamentadores de suas profissões.
		São muitas as vantagens de trabalhar com o Certificado Digital. É o futuro chegando e facilitando a sua vida.
		O Governo Federal Brasileiro adotou a certificação em várias de suas iniciativas:
- Programa Universidade para Todos – PROUNI
- Programa Juros Zero
- Troca de Informações de Saúde Suplementar – TISS
- Instituto Nacional da Propriedade Industrial – INPI
- ComprasNet
- Sistema de Diárias e Passagens
- Serviço de Documentos Oficiais – SIDOF
- Receita Federal – e-CAC, DCTF, DIRPF, DIRPJ, PAF (SRF/MF), SPED e NF-e
- Sistema de Pagamentos Brasileiro – SPB
- Sistema do Banco Central do Brasil – SISBACEN
- Sistema Integrado de Comércio Exterior – SISCOMEX
- Governo Estadual e Municipal – DETRAN/MG, CETESB/SP
- Sistema Jurídico
- Sistema de Peticionamento Eletrônico (SIPE)
- Cartório Eletrônico – Certidão de Protestos; Registro Civil (certidão de nascimento, de casamento, de óbito), Certidão de Registro, Registro de Imóveis, Tabelionato de Notas (certidão e escritura e de procuração).
		

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