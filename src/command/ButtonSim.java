package command;

import dao.ChatBDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ButtonSim implements Command {
    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*Pega o valor de qual tentativa foi resolvida*/
        ValidarResposta validarResposta = new ValidarResposta();
        int QualTentativa = validarResposta.Contador;

        /*Adiciona ao banco em qual tentativa foi resolvida*/

        ChatBDao dao = new ChatBDao();

        dao.QualTentativaCorreta(QualTentativa);



        dao.AtualizarTempo();

        RequestDispatcher view = request.getRequestDispatcher("chat.jsp");
        view.forward(request, response);
    }
}
