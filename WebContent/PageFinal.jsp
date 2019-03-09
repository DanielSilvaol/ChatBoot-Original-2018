<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="pacote.SessaoUsuario"%>
<%@ page import="pacote.SemanaDT"%>
<%@ page import="dao.ChatBDao"%>
<%@page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 720px; height: 373px; background-color: white; margin-left: 20%; margin-right: 40%; border-radius: 5px; padding: 5px; margin-left: 5%; border-color: black; border-style: solid; border-width: 2px;">

		<div>
			Obrigado </br> </br>
		</div>
		<div style="text-align: center; font-weight: 800">

			Tempo de conversa:
			<%
			SessaoUsuario sesseao = (SessaoUsuario) session.getAttribute("SessaoUsuario");

			SemanaDT semana = new SemanaDT();

			out.println(sesseao.getTempoSessao());
		%>

			<%
			ChatBDao dao = new ChatBDao();
	        dao.AtualizarTempo();
			%>


			</br>

		</div>

		<div class="bot"
			style="text-align: left; margin-top: 38%; margin-left: 75%; color: black; position: relative;">

		
					<td colspan="2" style="text-align: center"><a
		href="home.html"> <input type="submit"
			value="Voltar para pagina inicial" /></td>

		</div>
	</div>




</body>
</html>
