package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.text.SimpleDateFormat;

import dao.AtendimentoDao;
import dao.ChatBDao;
import dao.ConversaAtendimentoDAO;
import pacote.Cliente;
import pacote.SessaoUsuario;
import service.AtendimentoService;

@WebServlet(name = "ServletChat", urlPatterns = { "/Chatt" }, initParams = { @WebInitParam(name = "sala", value = "") })
public class ServletChat extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		SessaoUsuario sessaoUsuario = new SessaoUsuario();
		String msg = request.getParameter("msg");
		String sala = (String) getServletContext().getAttribute("sala");
		if (sala == null) {
			HttpSession session = request.getSession();
			String nick = (String) session.getAttribute("nick");
			String color = (String) session.getAttribute("color");
			sala = "Em que posso ajudar " + "<span style=\"color:" + color + ";font-size:20px" + "\">" + nick
					+ "</span>" + "<br>";
		}

		if ((msg != null) && (msg.trim().length() > 0)) {
			HttpSession session = request.getSession();
			String nick = (String) session.getAttribute("nick");
			String color = (String) session.getAttribute("color");


			Date data = new Date();
			SimpleDateFormat hora_format = new SimpleDateFormat("HH:mm");
			String mostra_hora = hora_format.format(data);


			sala += "<span style=\"color:" + color + "\">" + nick + "</span>" + ": " + msg + "<br/>"+mostra_hora+"<br/>";

			if((msg!=null)&&(nick!=null)){
				AtendimentoService service = new AtendimentoService();

				service.AdicionaConversaBanco(nick,msg);
				sessaoUsuario.addMensagem(nick,msg);


			}


		}



		getServletContext().setAttribute("sala", sala);
		response.sendRedirect("chatt.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
