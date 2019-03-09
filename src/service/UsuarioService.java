package service;

import pacote.Atend_Conversa;
import pacote.Usuario;
import dao.UsuarioDAO;

public class UsuarioService {
	
	public boolean validar(Usuario usuario){
		UsuarioDAO dao = new UsuarioDAO();
		return dao.validar(usuario);
	}

	AtendimentoService cs = new AtendimentoService();

	public int Conversa_00at(Atend_Conversa atd){
		cs.AdicionaPergunta(atd);
		return atd.getId_atendimento();
	}

}
