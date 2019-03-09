package command;

import dao.ChatBDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ContarTentativas implements Command{
	public static int FoiProAtendente;
    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(FoiProAtendente ==0){
            FoiProAtendente++;
        }

        ChatBDao dao = new ChatBDao();
        dao.InserirQuantidadeDeAtendimentoHumano(FoiProAtendente);
        int quantidade =dao.PegaQuantidadeDeAtendimentoHumano();

       RequestDispatcher view = request.getRequestDispatcher("index2.jsp");
        view.forward(request, response);
    }
}
