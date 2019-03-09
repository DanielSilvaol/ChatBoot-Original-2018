package dao;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import pacote.Cliente;
import pacote.Conversa;
import pacote.SemanaDT;
import pacote.Conversa;
public class ChatBDao {

	/*
	 * Atualizar atendimento
	 */

	public int AtualizarAtendimento(int id_Atendimento) {
		String sqlInsert = "update atendimento set Status_Atendimento = ? where ID_Atendimento = ? ";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, "Fechado");
			stm.setInt(2, id_Atendimento);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public void pdf() {
		
		try {
			String sqlSelect = "select cliente.Nome_Cliente,conversa.Pergunta,conversa.respostas from cliente \n" + 
					"join atendimento on cliente.ID_Cliente = atendimento.ID_Cliente\n" + 
					"join atendimento_conversa on atendimento_conversa.idatendimento_ac = atendimento.ID_Atendimento\n" + 
					"join conversa on conversa.ID_conversa= atendimento_conversa.IDconversa_ac where upper(cliente.ID_Cliente) like(select cliente.ID_Cliente from cliente order by ID_Cliente desc limit 1)";	;
			try (Connection conn = ConnectionFactory.obtemConexao();
					PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.execute();		
				
		System.out.println("1");
			Document document = new Document(PageSize.A4);
			
			System.out.println("2");
			
			PdfWriter.getInstance(document, new FileOutputStream("relatorio.pdf"));
			document.addAuthor("Cartorio");
			document.addTitle("Conversa");
			document.open();
			document.add(new Paragraph("---------------------------------------------------------Cartorio---------------------------------------------------------\n\n"));
		    document.addCreationDate();
		    System.out.println("3");
		    try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
		    
		          // fetch & writing records in pdf files
		        document.add(new Paragraph("Nome ::"+rs.getString(1)+"\nPergunta ::"+rs.getString(2)+"\nResposta ::"+rs.getString(3)+"\n\n"));
		    }
		    }catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		    System.out.println("4");
		    document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
		    document.close();
			System.out.println("borafdfhgmh");
		 
			
			System.out.println("acabou");
			try {
				System.out.println("acabou1");
				Desktop.getDesktop().open(new File("relatorio.pdf"));
				System.out.println("acabou2");
			} catch (IOException e) {
				System.out.println("fim");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}catch (Exception e) {
				// TODO: handle exception
			}
	}
	
	
	
	
	
	

	/*
	 * busca por semana
	 */
	public ArrayList<SemanaDT>  Semana(String nome_cliente) {
		ArrayList<SemanaDT> ps = new ArrayList<>();
		String sqlSelect = "select ate.id_atendimento, nome_cliente , cha.primeira_tentativa , cha.segunda_tentativa , cha.terceira_tentativa , cha.atendimento_humano, TIMEDIFF(ate.dt_fim, ate.dt_inicio), date_format(`dt_fim`,'%d-%c-%Y') from atendimento as ate join tentativas as cha on ate.id_atendimento = cha.id_tentativa join cliente as cli on cli.id_cliente = ate.id_atendimento where week(ate.dt_inicio) =  (select distinct week(ate.dt_inicio)  from atendimento as ate	where year(ate.dt_inicio) = year(now()) and month(ate.dt_inicio) = month(now()) and day(ate.dt_inicio)= day(now())) and upper(nome_cliente) like ?";

		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {		
			stm.setString(1, "%" + nome_cliente.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					SemanaDT semana = new SemanaDT();
					semana.setCodigoDoAtendimento(rs.getString("id_atendimento"));
					semana.setNomeDoCliente(rs.getString("nome_cliente"));
					semana.setQuantidadeDeTentativas(rs.getInt("primeira_tentativa"));
					semana.setQuantidadeDeTentativas2(rs.getInt("segunda_tentativa"));
					semana.setQuantidadeDeTentativas3(rs.getInt("terceira_tentativa"));
					semana.setQuantidadeDeTentativashumanas(rs.getInt("atendimento_humano"));
					semana.setDuracaoDoAtendimento(rs.getString("TIMEDIFF(ate.dt_fim, ate.dt_inicio)"));
					semana.setData(rs.getString("date_format(`dt_fim`,'%d-%c-%Y')"));
					ps.add(semana);
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return ps;

	}

	/*
	 * busca por semana
	 */

	public ArrayList<SemanaDT> ListaSemana() {
		ArrayList<SemanaDT> lista = new ArrayList<>();
		String sqlSelect = "select ate.id_atendimento, nome_cliente "
				+ ", cha.primeira_tentativa "
				+ ", cha.segunda_tentativa "
				+ ", cha.terceira_tentativa "
				+ ", cha.atendimento_humano "
				+ ", TIMEDIFF(ate.dt_fim, ate.dt_inicio) "
				+ ", date_format(`dt_fim`,'%d-%c-%Y') "
				+ "from atendimento as ate join tentativas as cha "
				+ "on ate.id_atendimento = cha.id_tentativa join cliente as cli"
				+ " on cli.id_cliente = ate.id_atendimento where week(ate.dt_inicio) = "
				+ " (select distinct week(ate.dt_inicio)  from atendimento as "
				+ "ate	where year(ate.dt_inicio) = year(now()) and month(ate.dt_inicio) = month(now()) and"
				+ " day(ate.dt_inicio)= day(now()) ) ";

		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
					while (rs.next()) {
						SemanaDT semana = new SemanaDT();
						semana.setCodigoDoAtendimento(rs.getString("id_atendimento"));
						semana.setNomeDoCliente(rs.getString("nome_cliente"));
						semana.setQuantidadeDeTentativas(rs.getInt("primeira_tentativa"));
						semana.setQuantidadeDeTentativas2(rs.getInt("segunda_tentativa"));
						semana.setQuantidadeDeTentativas3(rs.getInt("terceira_tentativa"));
						semana.setQuantidadeDeTentativashumanas(rs.getInt("atendimento_humano"));
						semana.setDuracaoDoAtendimento(rs.getString("TIMEDIFF(ate.dt_fim, ate.dt_inicio)"));
						semana.setData(rs.getString("date_format(`dt_fim`,'%d-%c-%Y')"));
						lista.add(semana);
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}




	public ArrayList<SemanaDT> ListaDia() {
		ArrayList<SemanaDT> lista = new ArrayList<>();
		String sqlSelect = "select ate.id_atendimento ,cli.nome_cliente ,cha.primeira_tentativa,TIMEDIFF(ate.dt_fim, ate.dt_inicio), date_format(`dt_fim`,'%d-%c-%Y') from atendimento as ate join tentativas as cha on ate.id_atendimento = cha.id_tentativa join cliente as cli on cli.id_cliente = ate.id_atendimento where year(dt_inicio) = year(now()) and month(dt_inicio) = month(now()) and day(dt_inicio) = day(now())";

		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
			 PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					SemanaDT semana = new SemanaDT();
					semana.setCodigoDoAtendimento(rs.getString("id_atendimento"));
					semana.setNomeDoCliente(rs.getString("nome_cliente"));
					semana.setQuantidadeDeTentativas(rs.getInt("primeira_tentativa"));
					semana.setQuantidadeDeTentativas2(rs.getInt("segunda_tentativa"));
					semana.setQuantidadeDeTentativas3(rs.getInt("terceira_tentativa"));
					semana.setQuantidadeDeTentativashumanas(rs.getInt("atendimento_humano"));
					semana.setDuracaoDoAtendimento(rs.getString("TIMEDIFF(ate.dt_fim, ate.dt_inicio)"));
					semana.setData(rs.getString("date_format(`dt_fim`,'%d-%c-%Y')"));
					lista.add(semana);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}



	public ArrayList<SemanaDT> ListaMes() {
		ArrayList<SemanaDT> lista = new ArrayList<>();
		String sqlSelect = "select ate.id_atendimento,cli.nome_cliente, cha.primeira_tentativa,cha.segunda_tentativa,cha.terceira_tentativa, cha.atendimento_humano,TIMEDIFF(ate.dt_fim, ate.dt_inicio), date_format(`dt_fim`,'%d-%c-%Y') from atendimento as ate join tentativas as cha on ate.id_atendimento = cha.id_tentativa join cliente as cli on cli.id_cliente = ate.id_atendimento where year(dt_inicio) = year(now())and month(dt_inicio) = month(now())";

		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
			 PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					SemanaDT semana = new SemanaDT();
					semana.setCodigoDoAtendimento(rs.getString("id_atendimento"));
					semana.setNomeDoCliente(rs.getString("nome_cliente"));
					semana.setQuantidadeDeTentativas(rs.getInt("primeira_tentativa"));
					semana.setQuantidadeDeTentativas2(rs.getInt("segunda_tentativa"));
					semana.setQuantidadeDeTentativas3(rs.getInt("terceira_tentativa"));
					semana.setQuantidadeDeTentativashumanas(rs.getInt("atendimento_humano"));
					semana.setDuracaoDoAtendimento(rs.getString("TIMEDIFF(ate.dt_fim, ate.dt_inicio)"));
					semana.setData(rs.getString("date_format(`dt_fim`,'%d-%c-%Y')"));
					lista.add(semana);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	/*
	 * -----------------------------------------------------------------------------
	 * ------------------------------------------------------------------
	 */
	/*
	 * Esse metodo pega a ultima pergunta. Essa ultima pergunta � para ser usado
	 * no metodo de troca de respostas
	 */

	public String Ultima() {
		Conversa conv = new Conversa();

		String sqlSelect = "select pergunta from conversa order by id_conversa desc limit 1";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					conv.setPergunta(rs.getString("pergunta"));
				} else {
					conv.setPergunta(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}

		return conv.getPergunta();
	}

	/*
	 * -----------------------------------------------------------------------------
	 * -------------------------------------------------------------- para tirar
	 * caracter especiais
	 * 
	 */
	public String TirarEspeciais(String aux) {
		String nova = new String();

		for (int i = 0; i < aux.length(); i++) {
			if ((aux.charAt(i) == ',') || (aux.charAt(i) == '.') || (aux.charAt(i) == ';') || (aux.charAt(i) == ':')
					|| (aux.charAt(i) == '/') || (aux.charAt(i) == '#') || (aux.charAt(i) == '?')
					|| (aux.charAt(i) == '!')) {

			} else {
				nova += aux.charAt(i);
			}
		}

		return nova;
	}

	public static String removeAccents(String str) {
		str = Normalizer.normalize(str, Normalizer.Form.NFD);
		str = str.replaceAll("[^\\p{ASCII}]", "");
		return str;
	}

	/*
	 * Esse metodo adiciona ao banco qual tentativa foi finalizada a resposta
	 * correta que o chat retornou.
	 */

	public void QualTentativaCorreta(int qualtentativa) {

		if (qualtentativa == 1) {
			String sqlSelect = "insert into tentativas (primeira_tentativa) values (1);";
			try (Connection conn = ConnectionFactory.obtemConexao();
					PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.execute();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (qualtentativa == 2) {
			String sqlSelect = "insert into tentativas (segunda_tentativa) values (1)";
			try (Connection conn = ConnectionFactory.obtemConexao();
					PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.execute();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (qualtentativa == 3) {

			String sqlSelect = "insert into tentativas (terceira_tentativa) values (1)";
			try (Connection conn = ConnectionFactory.obtemConexao();
					PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.execute();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		int total = 1;

		String sqlSelect = "insert into conversa (tentativa) values (?)";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, total);
			stm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void InserirQuantidadeDeAtendimentoHumano(int valor) {
		String sqlSelect = "INSERT INTO tentativas (atendimento_humano) values (?)";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, valor);
			stm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int pegaQuantidadeResolvidaDePrimeira() {
		int quantidadeDeElementos = 0;
		String sqlSelect = "select primeira_tentativa from tentativas ORDER BY ID_tentativa DESC LIMIT 1";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					quantidadeDeElementos = new Integer(quantidadeDeElementos);
					quantidadeDeElementos = rs.getInt("primeira_tentativa") + quantidadeDeElementos;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}

		return quantidadeDeElementos;
	}

	public int pegaQuantidadeResolvidaDeTerceira() {
		int quantidadeDeElementos = 0;
		String sqlSelect = "select terceira_tentativa from tentativas ORDER BY ID_tentativa DESC LIMIT 1";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					quantidadeDeElementos = new Integer(quantidadeDeElementos);
					quantidadeDeElementos = rs.getInt("terceira_tentativa") + quantidadeDeElementos;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}

		return quantidadeDeElementos;
	}

	public int pegaQuantidadeResolvidaDeSegunda() {
		int quantidadeDeElementos = 0;
		String sqlSelect = "select segunda_tentativa from tentativas ORDER BY ID_tentativa DESC LIMIT 1";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					quantidadeDeElementos = new Integer(quantidadeDeElementos);
					quantidadeDeElementos = rs.getInt("segunda_tentativa") + quantidadeDeElementos;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}

		return quantidadeDeElementos;
	}

	public int PegaQuantidadeDeAtendimentoHumano() {
		int quantidadeDeElementos = 0;
		String sqlSelect = "select atendimento_humano from tentativas ORDER BY ID_tentativa DESC LIMIT 1";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					quantidadeDeElementos = new Integer(quantidadeDeElementos);
					quantidadeDeElementos = rs.getInt("atendimento_humano") + quantidadeDeElementos;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}

		return quantidadeDeElementos;
	}

	/*
	 * Esse metodo faz a contagem de quantos clientes foram para o contato humano
	 */
	public void AtualizarTempo() {
		String sqlSelect = "UPDATE atendimento SET dt_fim = NOW() ORDER BY ID_Atendimento DESC LIMIT 1";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void Grafico() {
		try {
			String sqlSelect = "select * from cliente";
			try (Connection conn = ConnectionFactory.obtemConexao();
					PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.execute();
				
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Deu merda");
		}
	}
}
