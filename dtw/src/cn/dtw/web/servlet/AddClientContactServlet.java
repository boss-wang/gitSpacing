package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.entity.Clientcontact;
@WebServlet("/addClientContact")
public class AddClientContactServlet extends HttpServlet {
	private ClientContactDao clientserv = new ClientContactDaoImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientId=req.getParameter("clientId");
		String userAccount=req.getParameter("userAccount");
		String userPwd=req.getParameter("userPwd");
		String qq=req.getParameter("qq");
		String email = req.getParameter("email");
		Clientcontact clientContact = new Clientcontact();
		clientContact.setClientContactName(userAccount);
		clientContact.setClientContactTel(userPwd);
		clientContact.setClientContactEmail(email);
		clientContact.setClientContactQQ(qq);
		int contactId= clientserv.addClientContact(clientContact);
		int clientsId=Integer.parseInt(clientId);
		 clientserv.addClientidAndClientContactId(clientsId, contactId);
		 resp.getWriter().print(clientsId);
	}

}
