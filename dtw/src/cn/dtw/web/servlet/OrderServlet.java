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

import cn.dtw.entity.CostStatus;
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Order_cost;
import cn.dtw.entity.Order_pay;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
import cn.dtw.service.CostStatusService;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.customerservice.impl.CustomerOrderServiceImpl;
import cn.dtw.service.impl.CostStatusServiceImpl;
import cn.dtw.service.impl.OrderServiceImpl;
import cn.dtw.util.POI;

@WebServlet("/order.do")
public class OrderServlet extends BaseServlet {
	
	private static final long serialVersionUID = 5444940774766260440L;
	private OrderService orderService = new OrderServiceImpl();
	private CostStatusService costStatusService = new CostStatusServiceImpl();
	private CustomerOrderService customerOrderService = new CustomerOrderServiceImpl();
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
	//跳转修改订单页面
	protected void goUpdateOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		int currentPage = Integer.parseInt(req.getParameter("currentPage"));
		Order order = orderService.getOrderById(orderId);
		List<OrderStatus> statusList = orderService.getAllStatus();
		List<CustomsStatus> customsStatusList = orderService.getAllCustomsStatus();
		List<Terms> termsList = orderService.getAllTerms();
		req.setAttribute("statusList", statusList);
		req.setAttribute("customsStatusList", customsStatusList);
		req.setAttribute("termsList", termsList);
		req.setAttribute("order", order);
		req.setAttribute("currentPage", currentPage);
		req.getRequestDispatcher("/admin/updateOrder.jsp").forward(req, resp);
	}
	//跳转添加应付页面
		protected void goAddPay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int orderId = Integer.parseInt(req.getParameter("orderId"));
			int currentPage = Integer.parseInt(req.getParameter("currentPage"));
			Order order = orderService.getOrderById(orderId);
			List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
			req.setAttribute("order", order);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("costStatusList", costStatusList);
			req.getRequestDispatcher("/admin/addPay.jsp").forward(req, resp);
		}
	//跳转添加应收页面
	protected void goAddCost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		int currentPage = Integer.parseInt(req.getParameter("currentPage"));
		Order order = orderService.getOrderById(orderId);
		List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
		req.setAttribute("order", order);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("costStatusList", costStatusList);
		req.getRequestDispatcher("/admin/addCost.jsp").forward(req, resp);
	}
	//添加应付
		protected void addPay(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int orderId = Integer.parseInt(req.getParameter("orderId"));
			int supplierId = Integer.parseInt(req.getParameter("supplierId"));
			String unitPriceStr = req.getParameter("unitPrice");
			String otherPriceStr = req.getParameter("otherPrice");
			Double unitPrice = unitPriceStr==""?null:Double.parseDouble(unitPriceStr);
			Double otherPrice = otherPriceStr==""?null:Double.parseDouble(otherPriceStr);
			Double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
			String invoiceNo = req.getParameter("invoiceNo");
			int payStatus = Integer.parseInt(req.getParameter("costStatus"));
			Order_pay orderPay = new Order_pay();
			orderPay.setInvoiceNo(invoiceNo);
			orderPay.setOrderId(orderId);
			orderPay.setOtherPrice(otherPrice);
			orderPay.setPayStatus(payStatus);
			orderPay.setSupplierId(supplierId);
			orderPay.setTotalPrice(totalPrice);
			orderPay.setUnitPrice(unitPrice);
			if(orderService.addOrderPay(orderPay)) {
				resp.getWriter().print(1);
			}else{
				resp.getWriter().print(0);
			};
			resp.getWriter().close();
		}
	//添加应收
	protected void addCost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		int clientId = Integer.parseInt(req.getParameter("clientId"));
		Double cost = Double.parseDouble(req.getParameter("cost"));
		String invoiceNo = req.getParameter("invoiceNo");
		int costStatus = Integer.parseInt(req.getParameter("costStatus"));
		Order_cost orderCost = new Order_cost();
		orderCost.setClientId(clientId);
		orderCost.setCost(cost);
		orderCost.setCostStatus(costStatus);
		orderCost.setInvoiceNo(invoiceNo);
		orderCost.setOrderId(orderId);
		if(orderService.addOrderCost(orderCost)) {
			resp.getWriter().print(1);
		}else{
			resp.getWriter().print(0);
		};
		resp.getWriter().close();
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
		List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("orderList", orderList);
		req.setAttribute("costStatusList", costStatusList);
		req.getRequestDispatcher("/admin/showOrder.jsp").forward(req, resp);
	}
	//添加订单
	protected void addOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Order order = new Order();
		Date date = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String now = formater.format(date);
		String orderNo = "YAP"+now.substring(2, 4)+now.substring(5,7)+"C"+(int)(Math.random()*500);
		while(orderService.getOrderByOrderNo(order)!=null) {
			orderNo = "YAP"+now.substring(2, 4)+now.substring(5,7)+"C"+(int)(Math.random()*500);
			order.setOrderNo(orderNo);
		}
		String contactName = req.getParameter("contactName");
		int orderClientContactId = contactName==""?0:Integer.parseInt(contactName);
		String loadingPort = req.getParameter("loadingPort");
		int userId = Integer.parseInt(req.getParameter("userId"));
		String clientIdStr = req.getParameter("clientId");
		int clientId = Integer.parseInt(clientIdStr);
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
		order.setUpdateTime(now);
		order.setUserId(userId);
		order.setLoadingPort(loadingPort);
		order.setOrderClientContactId(orderClientContactId);

		PrintWriter out = resp.getWriter();
		if(orderService.addOrder(order)) {
			out.print(1);
		}else{
			out.print(0);
		};
		out.close();
	}
	//修改订单
	protected void updateOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		String clientIdStr = req.getParameter("clientId");
		int clientId = Integer.parseInt(clientIdStr);
		String loadingPort = req.getParameter("loadingPort");
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
		order.setOrderId(orderId);
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
		order.setRemarks(remarks);
		order.setStatusId(orderStatus);
		order.setSystemNo(systemNo);
		order.setTermsId(termsId);
		order.setLoadingPort(loadingPort);
		PrintWriter out = resp.getWriter();
		if(orderService.updateOrder(order)) {
			out.print(1);
		}else{
			out.print(0);
		};
		out.close();
	}
	//修改应付
	protected void updatePay(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int payId = Integer.parseInt(req.getParameter("payId"));
		String unitPriceStr = req.getParameter("unitPrice");
		String otherPriceStr = req.getParameter("otherPrice");
		Double unitPrice = unitPriceStr==""?null:Double.parseDouble(unitPriceStr);
		Double otherPrice = otherPriceStr==""?null:Double.parseDouble(otherPriceStr);
		Double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
		int payStatus = Integer.parseInt(req.getParameter("payStatus"));
		String invoiceNo = req.getParameter("invoiceNo");
		Order_pay orderPay = new Order_pay();
		orderPay.setId(payId);
		orderPay.setInvoiceNo(invoiceNo);
		orderPay.setOtherPrice(otherPrice);
		orderPay.setPayStatus(payStatus);
		orderPay.setTotalPrice(totalPrice);
		orderPay.setUnitPrice(unitPrice);
		if(orderService.updatePay(orderPay)) {
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);
		}
		resp.getWriter().close();
	}
	//修改应收
	protected void updateCost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int costId = Integer.parseInt(req.getParameter("costId"));
		Double cost = Double.parseDouble(req.getParameter("cost"));
		String invoiceNo = req.getParameter("invoiceNo");
		int costStatus = Integer.parseInt(req.getParameter("costStatus"));
		Order_cost orderCost = new Order_cost();
		orderCost.setId(costId);
		orderCost.setCost(cost);
		orderCost.setInvoiceNo(invoiceNo);
		orderCost.setCostStatus(costStatus);
		if(orderService.updateCost(orderCost)) {
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);
		}
		resp.getWriter().close();
	}
	//删除应收
	protected void delCost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int costId = Integer.parseInt(req.getParameter("costId"));
		Order_cost orderCost = new Order_cost();
		orderCost.setId(costId);
		if(orderService.delCost(orderCost)) {
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);
		}
		resp.getWriter().close();
	}
	//删除应付
	protected void delPay(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int payId = Integer.parseInt(req.getParameter("payId"));
		Order_pay orderPay = new Order_pay();
		orderPay.setId(payId);
		if(orderService.delPay(orderPay)) {
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);
		}
		resp.getWriter().close();
	}
	//删除订单
	protected void delOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.delOrder(order)) {
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);
		}
		resp.getWriter().close();
	}
	//显示客户自助下单的列表（员工可查看）
		protected void showCustomerOrders(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			this.getServletContext().setAttribute("newOrder",0);
			String curPage = req.getParameter("currentPage");
			int currentPage;
			User user = new User();
			user.setUserId(0);
			int totalRow = customerOrderService.getOrderCount(user);
			int totalPage = totalRow%10==0?totalRow/10:totalRow/10+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order> orderList = customerOrderService.getOrderList(user, currentPage, 10);
			List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", orderList);
			req.setAttribute("costStatusList", costStatusList);
			req.getRequestDispatcher("/admin/showCustomerOrder.jsp").forward(req, resp);
		}
		//搜索订单
		protected void searchOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String curPage = req.getParameter("currentPage");
			String searchContent = req.getParameter("serchContent");
			int currentPage;
			User user = (User)req.getSession().getAttribute("user");
			int totalRow = orderService.searchOrderCount(searchContent, user);
			int totalPage = totalRow%10==0?totalRow/10:totalRow/10+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order> orderList = orderService.searchOrderList(searchContent, user, currentPage, 10);
			List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", orderList);
			req.setAttribute("costStatusList", costStatusList);
			req.getRequestDispatcher("/admin/showOrder.jsp").forward(req, resp);
		}
		//搜索客户自助下单的列表（员工可查看）
		protected void searchCustomerOrders(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			String searchContent = req.getParameter("serchContent");
			String curPage = req.getParameter("currentPage");
			int currentPage;
			User user = new User();
			user.setUserId(0);
			int totalRow = orderService.searchOrderCount(searchContent, user);
			int totalPage = totalRow%10==0?totalRow/10:totalRow/10+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order> orderList = orderService.searchOrderList(searchContent,user, currentPage, 10);
			List<CostStatus> costStatusList = costStatusService.getAllCostStatus();
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", orderList);
			req.setAttribute("costStatusList", costStatusList);
			req.getRequestDispatcher("/admin/showCustomerOrder.jsp").forward(req, resp);
		}
		//下载员工所有订单
		protected void downloadOrderExcel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			User user = (User)req.getSession().getAttribute("user");
			List<Order> orderList = orderService.getOrderList(user);
			POI.outputOrderExcel(orderList, resp);
		}
		//下载散客订单文件
		protected void downloadCustomerOrderExcel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			User user = new User();
			user.setUserId(0);
			List<Order> orderList = orderService.getOrderList(user);
			POI.outputOrderExcel(orderList, resp);
		}
}
