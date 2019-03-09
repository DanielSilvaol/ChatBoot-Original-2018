package dao;

import pacote.Atend_Conversa;
import pacote.MensagemAt;

import java.sql.*;

public class ConversaAtendimentoDAO {

    public int AdicionarMensagem(MensagemAt mensagem_at) {
        String sql = "insert into hello_message(username,message) values (?,?);";
        try (Connection conn = ConnectionFactory.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, mensagem_at.getNome());
            stm.setString(2, mensagem_at.getMsg());
            stm.execute();

            String sqlQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
                 ResultSet rs = stm2.executeQuery();) {
                if (rs.next()) {
                   mensagem_at.setId_mensagem(rs.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return mensagem_at.getId_mensagem();
    }

    public int AdicionaPerguntaBanco(Atend_Conversa atend_conversa){

        String sql = "INSERT INTO perguntaf (pergunta, id_atendimento) values (?,?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, atend_conversa.getPergunta_usuario());
            stm.setInt(2, atend_conversa.getId_atendimento());
            stm.execute();
            String sqlQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
                if (rs.next()) {
                    atend_conversa.setId_atendimento(rs.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return atend_conversa.getId_atendimento();
    }
    public int AdicionaRespostaBanco(Atend_Conversa atend_conversa){

        String sql = "INSERT INTO respostaf (resposta, id_atendimento) values (?,?)";
        try (Connection conn = ConnectionFactory.obtemConexao();

            PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, atend_conversa.getResposta_atend());
            stm.execute();
            String sqlQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
                 ResultSet rs = stm2.executeQuery();) {
                if (rs.next()) {
                    atend_conversa.setId_atendimento(rs.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return atend_conversa.getId_atendimento();

    }
    public void AdicionaConversaBanco(String pergunta, String resposta){

        String sql = "INSERT INTO Conversa_Atendimento(id_conversa, perunta_usuario, resposta_atendente) VALUES (?,?,?);";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {

            stm.setString(1, pergunta);
            stm.setString(1, resposta);
            stm.execute();

            String sqlQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
                if (rs.next()) {
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
