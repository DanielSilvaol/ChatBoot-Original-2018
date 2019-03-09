package pacote;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import dao.ChatBDao;
import service.ClienteService;
import service.UsuarioService;

public class ChatB {

	public List<Conversa> conversas;
	public List<Atend_Conversa> conversa_at;

	public ChatB() {
		conversas = new ArrayList<>();
	}
	ChatBDao bot = new ChatBDao();

	public void addConversa_at(String pergunta_usuario){
		conversa_at.add(new Atend_Conversa(pergunta_usuario));

		Atend_Conversa atd = new Atend_Conversa();
		atd.setPergunta_usuario(pergunta_usuario);

		UsuarioService us = new UsuarioService();
		us.Conversa_00at(atd);

	}

	public void addConversa(String pergunta, String resposta) {
		conversas.add(new Conversa(pergunta, resposta));
		
		// para passar conversa para o banco
		Conversa conv = new Conversa();
		conv.setPergunta(pergunta);
		conv.setResposta(resposta);
		
		ClienteService cl = new ClienteService();
		cl.Conversa0(conv);
		
	}

	public List<Conversa> getConversas() {

		return new ArrayList<>(conversas);
	}


	//------------------- Conversa com o atendente -----------------\\



	public  final List<MensagemAt> conversasAt = new ArrayList<MensagemAt>();

	public final LocalDateTime inicioConversa = LocalDateTime.now();


	public void addMensagem(String nome, String mensagem) {
		conversasAt.add(new MensagemAt(nome,mensagem));
	}

	public List<MensagemAt> getConversasAt() {

		return conversasAt;
	}

	public long getTempoSessao() {
		return Duration.between(inicioConversa, LocalDateTime.now()).get(ChronoUnit.MINUTES);
	}


	int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

}