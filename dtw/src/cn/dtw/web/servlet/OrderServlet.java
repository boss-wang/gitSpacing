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
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.OrderStatus;
import cn.dtw.service.ClientService;
import cn.dtw.service.OrderService;
import cn.dtw.service.impl.ClientServiceImpl;
import cn.dtw.service.impl.OrderServiceImpl;

@WebServlet("/order.do")
public class OrderServlet extends BaseServlet {
	
	private static final long serialVersionUID = 5444940774766260440L;
	private ClientService clientService = new ClientServiceImpl();
	private OrderService orderService = new OrderServiceImpl();
	//跳转添加订单页面
	protected void goAddOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<OrderStatus> statusList = orderService.getAllStatus();
		List<CustomsStatus> customsStatusList = orderService.getAllCustomsStatus();
		req.setAttribute("statusList", statusList);
		req.setAttribute("customsStatusList", customsStatusList);
		req.getRequestDispatcher("/admin/addOrder.jsp").forward(req, resp);
	}
	
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
