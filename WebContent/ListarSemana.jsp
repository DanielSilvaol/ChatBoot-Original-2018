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
<script src="scripts/fusioncharts.js"></script>
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
								value="FuncBusca">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>

				<a class="btn btn-primary" href="ListarDia.jsp"  style="
    margin-top: 20px;
"> Dia </a>
				<a class="btn btn-primary" href="ListarMes.jsp" style="
    margin-top: 20px;
"> Mes</a>

					<a href="home.html" class="btn btn-primary pull-right h2"style="
    margin-top: 20px;
"> home</a>

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
					
					
			<!--   Grafico -->
			<%
    
/* 
    The following 4 code lines contain the database connection information.
    Alternatively, you can move these code lines to a separate file and
    include the file here. You can also modify this code based on your 
    database connection. 
*/

String hostdb = "localhost:3306";  // MySQl host
String userdb = "Alunos";  // MySQL username
String passdb = "alunos";  // MySQL password
String namedb = "chat";  // MySQL database name

    // Establish a connection to the database
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    Connection con = DriverManager.getConnection("jdbc:mysql://" + hostdb + "/" + namedb , userdb , passdb);
   
    %>
    <div class="row" style="text-align: center;">
    <div class="col-md-12"></div>
    <div id="chart"></div>
	</div>
    
     
    <%
     /*
        google-gson

        Gson is a Java library that can be used to convert Java Objects into 
        their JSON representation. It can also be used to convert a JSON string to 
        an equivalent Java object. Gson can work with arbitrary Java objects including
        pre-existing objects that you do not have source-code of.
        link : https://github.com/google/gson    
     */

        Gson gson = new Gson();
        
    	   
        // Form the SQL query that returns the top 10 most populous countries
        String sql="select count(ID_Atendimento), date_format(`dt_inicio`,'%c-%Y') from atendimento GROUP BY date_format(`dt_inicio`,'%c-%Y')";

        // Execute the query.
        PreparedStatement pt=con.prepareStatement(sql);    
        ResultSet rs=pt.executeQuery();
        
        // The 'chartobj' map object holds the chart attributes and data.
        Map<String, String> chartobj = new HashMap<String, String>();
        
        chartobj.put("caption" , "Meses mais acessados no cartorio");
        chartobj.put("yAxisName", "Usuarios");
        chartobj.put("xAxisName", "Meses");
        chartobj.put("paletteColors" , "#0075c2");
        chartobj.put("bgColor" , "#ffffff");
        chartobj.put("borderAlpha", "20");
        chartobj.put("canvasBorderAlpha", "0");
        chartobj.put("usePlotGradientColor", "0");
        chartobj.put("plotBorderAlpha", "10");
        chartobj.put("showXAxisLine", "1");
        chartobj.put("xAxisLineColor" , "#999999");
        chartobj.put("showValues" , "0");
        chartobj.put("divlineColor" , "#999999");
        chartobj.put("divLineIsDashed" , "1");
        chartobj.put("showAlternateHGridColor" , "0");

        // Push the data into the array using map object.
        ArrayList arrData = new ArrayList();
        while(rs.next())
        {
            Map<String, String> lv = new HashMap<String, String>();
            
            lv.put("value", rs.getString("count(ID_Atendimento)"));
            lv.put("label", rs.getString("date_format(`dt_inicio`,'%c-%Y')"));
            arrData.add(lv);             
        }
        
        //close the connection.
        rs.close();

        //create 'dataMap' map object to make a complete FC datasource.
        
         Map<String, String> dataMap = new LinkedHashMap<String, String>();  
    /*
        gson.toJson() the data to retrieve the string containing the
        JSON representation of the data in the array.
    */
         dataMap.put("chart", gson.toJson(chartobj));
         dataMap.put("data", gson.toJson(arrData));
/*
    Create an object for the column chart using the FusionCharts JSP class constructor. 
    Syntax for the constructor -
  new FusionCharts("type of chart", 
  "unique chart id", 
  "width of chart", 
  "height of chart", 
  "div id to render the chart", 
  "type of data", 
  "actual data in string format")
         
    Because we are using JSON data to render the chart, the data format will be `json`. 
    The object `dataMap` holds all the JSON data for the chart, 
    and will be passed as the value for the data source parameter of the constructor.
*/
        FusionCharts column2DChart= new FusionCharts(
                    "column2d",// chartType
                    "chart1",// chartId
                    "600","400",// chartWidth, chartHeight
                    "chart",// chartContainer
                    "json",// dataFormat
                    gson.toJson(dataMap) //dataSource
                );
       
        %>
        
<!--    Step 5: Render the chart    -->                
        <%=column2DChart.render()%>

					
					
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