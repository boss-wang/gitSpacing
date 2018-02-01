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
@WebServlet("/updateClient")
public class UpdateClientServlet extends HttpServlet {
	private ClientService clientserv = new ClientServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		String clientAddress = req.getParameter("clientAddress");
		String clientId = req.getParameter("clientId");
		Client client = new Client();
		client.setClientId(Integer.parseInt(clientId));
		client.setClientName(clientName);
		client.setClientAddress(clientAddress);
		int res=clientserv.getResultById(client);
		resp.getWriter().print(res);
	}

}
