package service;

import java.util.ArrayList;

import dao.ChatBDao;
import pacote.SemanaDT;

public class ManterClienteService {

	ChatBDao dao;

	public ManterClienteService() {
		dao = new ChatBDao();
	}

	public ArrayList<SemanaDT> Semana(String nome_cliente) {
		return dao.Semana(nome_cliente);
	}

	public ArrayList<SemanaDT> SemanaList() {
		return dao.ListaSemana();
	}

	public ArrayList<SemanaDT> Mes(String nome_cliente) {
		return dao.Semana(nome_cliente);
	}

	public ArrayList<SemanaDT> MesList() {
		return dao.ListaMes();
	}

	public ArrayList<SemanaDT> Dia(String nome_cliente) {
		return dao.Semana(nome_cliente);
	}

	public ArrayList<SemanaDT> DiaList() {
		return dao.ListaDia();
	}
}
