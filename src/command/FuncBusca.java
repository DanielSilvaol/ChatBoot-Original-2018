package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pacote.SemanaDT;
import pacote.SessaoUsuario;
import service.ManterClienteService;



public class FuncBusca implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String chave = request.getParameter("data[search]");
		ArrayList<SemanaDT> lista = null;
		
		SemanaDT semana = new SemanaDT();
		HttpSession session = request.getSession();
		ManterClienteService sessio = new ManterClienteService(); 
		
		
		if (chave != null && chave.length() > 0) {
			lista = sessio.Semana(chave);
		} else {
			lista = sessio.SemanaList();
		}
		int vl = 2;
		session.setAttribute("lista", lista);
		session.setAttribute("semana", semana);
		RequestDispatcher dispatcher = (RequestDispatcher) request
				.getRequestDispatcher("ListarSemana.jsp");
		dispatcher.forward(request, response);
	}

}
