package pacote;

public class Atend_Conversa {

	private int id_atendimento;
	private String pergunta_usuario;
	private String resposta_atend;

	public Atend_Conversa(String pergunta_usuario){

		this.pergunta_usuario = pergunta_usuario;
	}

	public Atend_Conversa() {
	}

	public int getId_atendimento() {

		return id_atendimento;
	}

	public void setId_atendimento(int id_atendimento) {

		this.id_atendimento = id_atendimento;
	}

	public String getPergunta_usuario() {

		return pergunta_usuario;
	}

	public void setPergunta_usuario(String pergunta_usuario) {

		this.pergunta_usuario = pergunta_usuario;
	}

	public String getResposta_atend() {

		return resposta_atend;
	}

	public void setResposta_atend(String resposta_atend) {

		this.resposta_atend = resposta_atend;
	}

	@Override
	public String toString() {
		return "Atend_Conversa{" + "id_atendimento=" + id_atendimento + ", pergunta_usuario='" + pergunta_usuario + '\'' + ", resposta_atend='" + resposta_atend + '\'' + '}';
	}
}
