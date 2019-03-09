package command;

import dao.ChatBDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Finalizar implements Command{
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChatBDao dao = new ChatBDao();

          dao.AtualizarTempo();
        HttpSession session = request.getSession();
        String nick = (String) session.getAttribute("nick");

        if(nick.equals("Atendente")){
              RequestDispatcher view = request.getRequestDispatcher("index3.jsp");
              view.forward(request, response);
          }

        RequestDispatcher view = request.getRequestDispatcher("Inicio.html");
        view.forward(request, response);
    }
}