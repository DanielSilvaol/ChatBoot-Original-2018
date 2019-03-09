package service;

import dao.ClienteDao;
import pacote.Cliente;
import pacote.Conversa;

public class ClienteService {
	
	
	public ClienteDao dao = new ClienteDao();
	
	public Cliente carregar(int id){

		return dao.carregarCliente(id);
	}

	public int criarCliente(Cliente cli) {
		
		return dao.cadastroCliente(cli);
		
	}
	
	ConversaService cs = new ConversaService();

	public int Conversa0(Conversa conv) {
		cs.Conversa01(conv);
		return   conv.getId_conversa() ;
	}
	
}
