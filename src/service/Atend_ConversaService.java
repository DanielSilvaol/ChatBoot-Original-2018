package service;

import dao.Atend_ConversaDao;
import pacote.TabNpN;

public class Atend_ConversaService {
	
	Atend_ConversaDao dao = new Atend_ConversaDao();
	
	public int Atend(TabNpN ac) {
		
		return dao.Atendimento_conversa(ac);
	}
	public void Select() {
		dao.SelctAten();
	}
}
