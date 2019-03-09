package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pacote.Atendimento;
import pacote.ChatB;
import pacote.Cliente;
import service.AtendimentoService;
import service.ClienteService;


public class CriarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String pNome = request.getParameter("nome");
        String pEmail = request.getParameter("email");
        
        Cliente cli = new Cliente();
        cli.setNome(pNome);
        cli.setEmail(pEmail);
        
        ClienteService service = new ClienteService();        
        int id = service.criarCliente(cli);
        cli.setId(id);
        
    	Atendimento atd = new Atendimento();
        atd.setId_cliente(cli.getId());
		atd.setId_atendente(1);
		
        AtendimentoService as = new AtendimentoService();
        as.Criar_Ate(atd);
        

        session.setAttribute("cliente", cli);
        session.setAttribute("chat", new ChatB());

        RequestDispatcher view = request.getRequestDispatcher("chat.jsp");
        view.forward(request, response);
    }
}
