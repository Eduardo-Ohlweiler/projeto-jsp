package servlets;

import java.io.IOException;

import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ModelLogin;


@WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();  

    public ServletUsuarioController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//response.sendRedirect("principal/usuario.jsp");
		try 
		{
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) 
			{
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUser(idUser);
				request.setAttribute("msg", "Excluido com sucesso");
			}
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		try {
			
			String msg = "Operação realizada com sucesso";
			
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			
			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);//se tiver converte para long, se não tiver seta null
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			
			
			if(daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Ja existe usuario com esse login, informe outro";
			} else {
				if(modelLogin.isNovo()) {
					msg = "Gravado com sucesso";
				} else {
					msg = "Atualizado com sucesso";
				}
				modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin);
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);//seta os valores de volta ao formulario pela tag value
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("principal/usuario.jsp");//redireciona de volta a tela após salvar
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

}
