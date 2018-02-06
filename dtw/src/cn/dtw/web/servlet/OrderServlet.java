package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;

@WebServlet("/order.do")
public class OrderServlet extends BaseServlet {

	private static final long serialVersionUID = 5444940774766260440L;
	
	//根据客户名模糊查询
	protected void findClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		
	}
	
}
