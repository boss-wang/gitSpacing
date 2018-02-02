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
@WebServlet("/addclient")
public class AddClientServlet extends HttpServlet {
	private ClientService serv = new ClientServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		String clientAddress = req.getParameter("clientAddress");
		Client client = new  Client ();
		client.setClientName(clientName);
		client.setClientAddress(clientAddress);
		int  back=	serv.addClient(client);
		resp.getWriter().print(back);
	}

}
