package service;


import dao.AtendimentoDao;
import dao.ChatBDao;
import dao.ConversaAtendimentoDAO;

import pacote.Atend_Conversa;
import pacote.Atendimento;
import pacote.MensagemAt;


public class AtendimentoService {
	ConversaAtendimentoDAO Adao = new ConversaAtendimentoDAO();
	AtendimentoDao dao = new AtendimentoDao();

	public int Criar_Ate(Atendimento atd) {
		return dao.cadastroAtendimento(atd);
	}





	public int AdicionaResposta(Atend_Conversa atd){
		return Adao.AdicionaRespostaBanco(atd);

	}



	public void AdicionaConversaBanco(String nick,String msg) {
		Adao.AdicionaConversaBanco(nick, msg);
	}



	public int AdicionaPergunta(Atend_Conversa atd){

		return Adao.AdicionaPerguntaBanco(atd);

	}
	public int AdicionaConversa(MensagemAt mensagem_at)  {
		return Adao.AdicionarMensagem(mensagem_at);
	}
}
