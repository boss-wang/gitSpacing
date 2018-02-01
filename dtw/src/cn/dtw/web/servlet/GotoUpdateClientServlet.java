package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.service.ClientService;
import cn.dtw.service.impl.ClientServiceImpl;
@WebServlet("/gotoUpdateClient")
public class GotoUpdateClientServlet extends HttpServlet {
	private ClientService clientser = new ClientServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId = req.getParameter("clientId");
		String currentpage = req.getParameter("currentpage");
		Client client = new Client();
		client.setClientId(Integer.parseInt(clientId));
		Client  clientText =  clientser.getClienttext(client);
		req.setAttribute("currentpage", currentpage);
		req.setAttribute("clientText", clientText);
		req.getRequestDispatcher("admin/updateClientAddress.jsp").forward(req, resp);
		
	}

}
