package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChatBDao;
import pacote.Cliente;
import pacote.ChatB;
import pacote.Conversa;
import pacote.Resposta;
import pacote.SessaoUsuario;
import pacote.TabNpN;
import service.Atend_ConversaService;
import service.AtendimentoService;
import service.ChatService;

public class ChatBot implements Command {
	public static final String CHAT = "chat";
	public static final String RESPOSTA_NAO_ENCONTRADA = "Desculpe, mas não tenho a resposta para sua pergunta! Você pode reformular a sua pergunta?";
	public static final String ATT_PERG = "pergunta";
	public ChatService chatService = new ChatService();
	ChatBDao chatJ = new ChatBDao();

	private static final long serialVersionUID = 1L;

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ChatB chat = (ChatB) session.getAttribute(CHAT);
		String pergunta = request.getParameter(ATT_PERG);

		String respostaA = chatJ.TirarEspeciais(pergunta);
		String respostaB = chatJ.removeAccents(respostaA);
		Resposta resposta = chatService.buscaResposta(respostaB.toLowerCase());

		// Adicionando ao Banco a Conversa
		if (resposta == null) {

			chat.addConversa(pergunta, RESPOSTA_NAO_ENCONTRADA);

		} else {
			chat.addConversa(pergunta, resposta.getValor());

		}
		
		Conversa conversa = new Conversa();
		request.setAttribute("conversa", conversa);
		// veicular o atendimento com a resposta
		Atend_ConversaService ate = new Atend_ConversaService();
		ate.Select();
	
        session.setAttribute("SessaoUsuario", new SessaoUsuario());

		Cliente cliente = (Cliente) session.getAttribute("cliente");
		
		request.setAttribute("conversa", conversa);

		session.setAttribute(CHAT, chat);
		session.setAttribute("Cliente", cliente);

		RequestDispatcher view = request.getRequestDispatcher("chat.jsp");
		view.forward(request, response);

	}
}
