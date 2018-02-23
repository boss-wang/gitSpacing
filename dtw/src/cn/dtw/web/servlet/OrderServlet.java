package cn.dtw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
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
		List<Terms> termsList = orderService.getAllTerms();
		req.setAttribute("statusList", statusList);
		req.setAttribute("customsStatusList", customsStatusList);
		req.setAttribute("termsList", termsList);
		req.getRequestDispatcher("/admin/addOrder.jsp").forward(req, resp);
	}
	//显示订单列表
	protected void showOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		User user = (User)req.getSession().getAttribute("user");
		int totalRow = orderService.getOrderCount(user);
		int totalPage = totalRow%10==0?totalRow/10:totalRow/10+1;
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Order> orderList = orderService.getOrderList(user, currentPage, 10);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("/admin/showOrder.jsp").forward(req, resp);
	}
	//添加订单
	protected void addOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String clientIdStr = req.getParameter("clientId");
		int clientId = Integer.parseInt(clientIdStr);
		String orderNo = req.getParameter("orderNo");
		String systemNo = req.getParameter("systemNo");
		String mawbNo = req.getParameter("mawbNo");
		String hawbNo = req.getParameter("hawbNo");
		String flightNo = req.getParameter("flightNo");
		String departDate = req.getParameter("departDate");
		departDate = departDate==""?null:departDate;
		String arriveDate = req.getParameter("arriveDate");
		arriveDate = arriveDate==""?null:arriveDate;
		String destination = req.getParameter("destination");
		String cargoPieces = req.getParameter("cargoPieces");
		String cargoWeightStr = req.getParameter("cargoWeight");
		Double cargoWeight = cargoWeightStr==""?null:Double.parseDouble(cargoWeightStr);
		String chargeWeightStr = req.getParameter("chargeWeight");
		Double chargeWeight = chargeWeightStr==""?null:Double.parseDouble(chargeWeightStr);
		String cargoVolumeStr = req.getParameter("cargoVolume");
		Double cargoVolume = cargoVolumeStr==""?null:Double.parseDouble(cargoVolumeStr);
		int customsStatus = Integer.parseInt(req.getParameter("customsStatus"));
		String customsNo = req.getParameter("customsNo");
		int orderStatus = Integer.parseInt(req.getParameter("orderStatus"));
		String remarks = req.getParameter("remarks");
		int termsId = Integer.parseInt(req.getParameter("terms"));
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
		order.setTermsId(termsId);
		Date date = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		order.setUpdateTime(formater.format(date));
		order.setUserId(userId);
		System.out.println(order.getArriveDate()+order.getCargoPiece()+order.getCargoVolume()+
				order.getCargoWeight()+order.getChargeWeight()+order.getClientId()+order.getCustomsNo()+order.getCustomsStatus()+order.getDepartDate()+order.getDestination()+
				order.getFlightNo()+order.getHawbNo()+order.getMawbNo()+order.getOrderNo()+order.getRemarks()+order.getStatusId()+order.getSystemNo()+order.getUpdateTime()+order.getUserId());
		PrintWriter out = resp.getWriter();
		if(orderService.addOrder(order)) {
			out.print(1);
		}else{
			out.print(0);
		};
		out.close();
	}
	
}
