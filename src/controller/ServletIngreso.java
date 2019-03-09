package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pacote.Cliente;
@WebServlet(name = "ServletIngreso", urlPatterns = {"/Ingreso"})
public class ServletIngreso extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {
    	//Cliente cliente = new Cliente();
        //String nick = cliente.getNome();
    	String nick = request.getParameter("nick");
        String color;
        String target = "index2.jsp";

        if(nick.equals("Atendente")) {
        	color = "#009";
        }
        else {
            color= "#900";
        }

        if ((nick != null) && nick.trim().length() > 0) {
            HttpSession session = request.getSession(true);
            session.setAttribute("nick", nick);
            session.setAttribute("color", color);

            target = "Chatt";
        }

        response.sendRedirect(target);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";

    }
}
