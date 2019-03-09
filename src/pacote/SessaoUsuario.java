package pacote;

import dao.ChatBDao;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class SessaoUsuario {
	
		
	
   public  final List<MensagemAt> conversasAt = new ArrayList<MensagemAt>();

    public  final LocalDateTime inicioConversa = LocalDateTime.now();

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String nome = new String();



    ChatBDao dao = new ChatBDao();
    public void addMensagem(String nome, String mensagem) {
       
    	conversasAt.add(new MensagemAt(nome,mensagem));
    }

    public List<MensagemAt> getConversasAt() {
        return conversasAt;
    }

    public  long getTempoSessao() {
        return Duration.between(inicioConversa, LocalDateTime.now()).get(ChronoUnit.SECONDS);
    }
    public int getContatoHumano(){

        return dao.PegaQuantidadeDeAtendimentoHumano();
    }
    public int getPegaPrimeira(){
        return dao.pegaQuantidadeResolvidaDePrimeira();
    }
    public int getPegaSegunda(){
        return dao.pegaQuantidadeResolvidaDeSegunda();
    }
    public int getPegaTerceira(){
        return dao.pegaQuantidadeResolvidaDeTerceira();
    }
  

    int id;

    public int getId() {
        return id;
    }
}
