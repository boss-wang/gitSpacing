package cn.dtw.web.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.service.OrderService;
import cn.dtw.service.impl.OrderServiceImpl;

@WebServlet("/order.do")
public class OrderServlet extends BaseServlet {
	
	private static final long serialVersionUID = 5444940774766260440L;
	private OrderService orderService = new OrderServiceImpl();
	//跳转添加订单页面
	protected void goAddOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<OrderStatus> statusList = orderService.getAllStatus();
		List<CustomsStatus> customsStatusList = orderService.getAllCustomsStatus();
		req.setAttribute("statusList", statusList);
		req.setAttribute("customsStatusList", customsStatusList);
		req.getRequestDispatcher("/admin/addOrder.jsp").forward(req, resp);
	}
	
	//添加订单
	protected void addOrder(HttpServletRequest req, HttpServletResponse resp) {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String clientIdStr = req.getParameter("clientId");
		int clientId = Integer.parseInt(clientIdStr);
		String orderNo = req.getParameter("orderNo");
		String systemNo = req.getParameter("systemNo");
		String mawbNo = req.getParameter("mawbNo");
		String hawbNo = req.getParameter("hawbNo");
		String flightNo = req.getParameter("flightNo");
		String departDate = req.getParameter("departDate");
		String arriveDate = req.getParameter("arriveDate");
		String destination = req.getParameter("destination");
		String cargoPieces = req.getParameter("cargoPieces");
		String cargoWeightStr = req.getParameter("cargoWeight");
		double cargoWeight = cargoWeightStr==""?0:Double.parseDouble(cargoWeightStr);
		String chargeWeightStr = req.getParameter("chargeWeight");
		double chargeWeight = chargeWeightStr==""?0:Double.parseDouble(chargeWeightStr);
		String cargoVolumeStr = req.getParameter("cargoVolume");
		double cargoVolume = cargoVolumeStr==""?0:Double.parseDouble(cargoVolumeStr);
		int customsStatus = Integer.parseInt(req.getParameter("customsStatus"));
		String customsNo = req.getParameter("customsNo");
		int orderStatus = Integer.parseInt(req.getParameter("orderStatus"));
		String remarks = req.getParameter("remarks");
		Order order = new Order();
		order.setArriveDate(arriveDate);
		order.setCargoPiece(cargoPieces);
		order.setCargoVolume(cargoVolume);
		order.setCargoWeight(cargoWeight);
		order.setChargeWeight(chargeWeight);
		order.setClientId(clientId);
		order.setCustomsNo(customsNo);
		order.setCustomsStatus(customsStatus);
		order.setDepartDate(departDate);
		order.setDestination(destination);
		order.setFlightNo(flightNo);
		order.setHawbNo(hawbNo);
		order.setMawbNo(mawbNo);
		order.setOrderNo(orderNo);
		order.setRemarks(remarks);
		order.setStatusId(orderStatus);
		order.setSystemNo(systemNo);
		Date date = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd ");
		order.setUpdateTime(formater.format(date));
		order.setUserId(userId);
		System.out.println(userId);
		System.out.println(order.getUpdateTime());
	}
	
}
