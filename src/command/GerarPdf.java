package command;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChatBDao;

public class GerarPdf implements Command {
	ChatBDao chat = new ChatBDao();

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		chat.pdf();
		
		/*id="sim"
				name="command" value="ButtonSim"*/
		RequestDispatcher view = request.getRequestDispatcher("controller.do?command=ButtonSim");
		view.forward(request, response);
		
	}
	
}
