package pacote;

public class SemanaDT {
	 private String CodigoDoAtendimento;
	 private String NomeDoCliente; 
	 private int QuantidadeDeTentativas;
	 private int QuantidadeDeTentativas2;
	 private int QuantidadeDeTentativas3;
	 private int QuantidadeDeTentativashumanas;
	 private String DuracaoDoAtendimento;
	 private String tempo;
	 private String data;
	 
	 public SemanaDT() {
	
		// TODO Auto-generated constructor stub
	}
	public SemanaDT(String CodigoDoAtendimento, String NomeDoCliente, int QuantidadeDeTentativas, int QuantidadeDeTentativas2, int QuantidadeDeTentativas3, int QuantidadeDeTentativashumanas,
			String DuracaoDoAtendimento, String tempo) {
		super();
		this.CodigoDoAtendimento = CodigoDoAtendimento;
		this.NomeDoCliente = NomeDoCliente;
		this.QuantidadeDeTentativas = QuantidadeDeTentativas;
		this.QuantidadeDeTentativas2 = QuantidadeDeTentativas2;
		this.QuantidadeDeTentativas3 = QuantidadeDeTentativas3;
		this.QuantidadeDeTentativashumanas = QuantidadeDeTentativashumanas;
		this.DuracaoDoAtendimento = DuracaoDoAtendimento;
		this.data = data;
	}
	public String getCodigoDoAtendimento() {
		return CodigoDoAtendimento;
	}
	public void setCodigoDoAtendimento(String CodigoDoAtendimento) {
		this.CodigoDoAtendimento = CodigoDoAtendimento;
	}
	public String getData() {
		return data;
	}
	public String getNomeDoCliente() {
		return NomeDoCliente;
	}
	public void setNomeDoCliente(String NomeDoCliente) {
		this.NomeDoCliente = NomeDoCliente;
	}
	public int getQuantidadeDeTentativas() {
		return QuantidadeDeTentativas;
	}
	public int getQuantidadeDeTentativas2() {
		return QuantidadeDeTentativas2;
	}
	public int getQuantidadeDeTentativas3() {
		return QuantidadeDeTentativas3;
	}
	public int getQuantidadeDeTentativashumanas() {
		return QuantidadeDeTentativashumanas;
	}
	public void setQuantidadeDeTentativas(int QuantidadeDeTentativas) {
		this.QuantidadeDeTentativas = QuantidadeDeTentativas;
	}
	public void setQuantidadeDeTentativas2(int QuantidadeDeTentativas2) {
		this.QuantidadeDeTentativas2 = QuantidadeDeTentativas2;
	}
	public void setQuantidadeDeTentativas3(int QuantidadeDeTentativas3) {
		this.QuantidadeDeTentativas3 = QuantidadeDeTentativas3;
	}
	public void setQuantidadeDeTentativashumanas(int QuantidadeDeTentativashumanas) {
		this.QuantidadeDeTentativashumanas = QuantidadeDeTentativashumanas;
	}
	public String getDuracaoDoAtendimento() {
		return DuracaoDoAtendimento;
	}
	public void setDuracaoDoAtendimento(String DuracaoDoAtendimento) {
		this.DuracaoDoAtendimento = DuracaoDoAtendimento;
	}
	
	public String getTempo() {
		return tempo;
	}
	public void setTempo(String Tempo) {
		this.tempo = Tempo;
	}
	public void setData(String data) {
		this.data = data;
	}
}
