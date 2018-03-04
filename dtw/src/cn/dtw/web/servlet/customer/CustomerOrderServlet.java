package cn.dtw.web.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
import cn.dtw.service.CostStatusService;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.ClienttempService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.impl.ClientTempServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerOrderServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.service.impl.CostStatusServiceImpl;
import cn.dtw.service.impl.OrderServiceImpl;
import cn.dtw.web.servlet.BaseServlet;
@WebServlet("/custorder.do")
public class CustomerOrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1841587775305891652L;
	private CustomerOrderService customerOrderService = new CustomerOrderServiceImpl();
	private CustomerService customerService = new CustomerServiceImpl();
	private CostStatusService costStatusService = new CostStatusServiceImpl();
	private OrderService orderService = new OrderServiceImpl();
	private ClienttempService clientTempService = new  ClientTempServiceImpl();
	//后台审核通过
	protected void takeOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.updateOrderStatus(order, 0)){
			resp.getWriter().print(1);
		};
		resp.getWriter().close();
	}
	//后台审核不通过
	protected void refuseOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.updateOrderStatus(order, 8)){
			resp.getWriter().print(1);
		};
		resp.getWriter().close();
	}
	//取消订单
	protected void cancelOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.updateOrderStatus(order, 7)){
			resp.getWriter().print(1);
		};
		resp.getWriter().close();
	}
	//显示客户自助下单的列表（员工可查看）
	protected void showCustomerOrders(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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
	//跳转客户下单页面
	protected void goAddCustomerOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer customer = (Customer)req.getSession().getAttribute("customer");
		if(customer!=null) {
			List<Terms> termsList = orderService.getAllTerms();
			List<Clientcontact> clientcontactList = customerService.getAllContactIdByClientId(customer);
			req.setAttribute("termsList", termsList);
			req.setAttribute("clientcontactList", clientcontactList);
			req.getRequestDispatcher("/addCustomerOrder.jsp").forward(req, resp);
		}
	}
	//保存下单
	protected void addCustomerOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String departDate=req.getParameter("departDate");
		String loadingPort=req.getParameter("loadingPort");
		String destination=req.getParameter("destination");
		String cargoPiece=req.getParameter("cargoPiece");
		String weight=req.getParameter("weight");
		String volume=req.getParameter("volume");
		String typetrading=req.getParameter("typetrading");
		int contactId=Integer.parseInt(req.getParameter("contactId"));
		String customerId=req.getParameter("customerId");
		Order order = new Order();
		order.setDepartDate(departDate);
		order.setLoadingPort(loadingPort);
		order.setDestination(destination);
		order.setCargoPiece(cargoPiece);
		order.setCargoWeight(Double.parseDouble(weight));
		order.setCargoVolume(Double.parseDouble(volume));
		order.setTermsId(Integer.parseInt(typetrading));
		order.setOrderClientContactId(contactId);
		Customer customer = new Customer();
		customer.setId(Integer.parseInt(customerId));
		Customer_client custClient= customerService.getClientBycust(customer);
		order.setClientId(custClient.getClientId());
		boolean back=customerOrderService.addCustomerOrder(order);
		resp.getWriter().print(back);
	}
	//申请绑定公司
		protected void bindingCompany (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String clientName=req.getParameter("clientName");
			String clientAddress=req.getParameter("clientAddress");
			String customerId=req.getParameter("customerId");
			Clienttemp clienttemp = new Clienttemp();
			clienttemp.setClientName(clientName);
			clienttemp.setClientAddress(clientAddress);
			Clienttemp_customer clienttemp_customer =  new Clienttemp_customer();
			clienttemp_customer.setCustomerId(Integer.parseInt(customerId));
			int back= clientTempService.addClienttemp_customer(clienttemp_customer, clienttemp);
			Object obj = req.getSession().getAttribute("customer");
			Customer customer =(Customer)obj;
			Customer cust = customerService.getCustomer(customer);
			req.getSession().removeAttribute("customer");
			req.getSession().setAttribute("customer",cust);
			resp.getWriter().print(back);
		}
		//显示客户自助下单的列表（客户查看）
		protected void showCustomerOrdersByClientId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String curPage = req.getParameter("currentPage");
			int currentPage;
			Customer customer = (Customer)req.getSession().getAttribute("customer");
			Customer_client customer_client = customerService.getClientBycust(customer);
			Client client = new Client();
			client.setClientId(customer_client.getClientId());
			int totalRow = customerOrderService.getOrderCount(client);
			int totalPage = totalRow%6==0?totalRow/6:totalRow/6+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order> orderList = customerOrderService.getOrderListByClientId(client, currentPage, 6);
			List<OrderStatus> statusList = orderService.getAllStatus();
			List<Terms> termsList = orderService.getAllTerms();
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", orderList);
			req.setAttribute("statusList", statusList);
			req.setAttribute("termsList", termsList);
			req.getRequestDispatcher("/showMyOrder.jsp").forward(req, resp);
		}
		//客户应付订单查询
		protected void showCustomerPayOrdersByClientId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String curPage = req.getParameter("currentPage");
			Customer customer = (Customer)req.getSession().getAttribute("customer");
			int currentPage;
			int totalRow = customerOrderService.getPayOrderCountByCustomerId(customer);
			int totalPage = totalRow%6==0?totalRow/6:totalRow/6+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order> payorderList = customerOrderService.getPayOrderByCustomerId(customer, currentPage, 6);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", payorderList);
			req.getRequestDispatcher("/payorder.jsp").forward(req, resp);
		}
}
