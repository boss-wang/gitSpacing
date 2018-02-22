package cn.dtw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.dtw.entity.Client;
import cn.dtw.service.ClientService;
import cn.dtw.service.impl.ClientServiceImpl;

@WebServlet("/order.do")
public class OrderServlet extends BaseServlet {

	private static final long serialVersionUID = 5444940774766260440L;
	private ClientService clientService = new ClientServiceImpl();
	//模糊查询客户名
	protected void findClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String clientName = req.getParameter("clientName");
		List<Client> clientList = clientService.getClientByName(clientName);
		String clientJson = JSON.toJSONString(clientList);
		PrintWriter out = resp.getWriter();
		out.print(clientJson);
		out.close();
	}
	
}
