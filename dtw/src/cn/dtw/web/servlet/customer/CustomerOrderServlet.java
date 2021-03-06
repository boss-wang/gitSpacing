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
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Order_cost;
import cn.dtw.entity.Terms;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.ClienttempService;
import cn.dtw.service.customerservice.CustomerCostService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.impl.ClientTempServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerCostServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerOrderServiceImpl;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.service.impl.OrderServiceImpl;
import cn.dtw.util.phone.SDKDemo;
import cn.dtw.web.servlet.BaseServlet;
@WebServlet("/custorder.do")
public class CustomerOrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1841587775305891652L;
	private CustomerOrderService customerOrderService = new CustomerOrderServiceImpl();
	private CustomerService customerService = new CustomerServiceImpl();
	
	private OrderService orderService = new OrderServiceImpl();
	private ClienttempService clientTempService = new  ClientTempServiceImpl();
	private CustomerCostService customerCostService= new CustomerCostServiceImpl();
	//后台审核通过
	protected void takeOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		String contactTel = req.getParameter("contactTel");
		String orderNo = req.getParameter("orderNo");
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.updateOrderStatus(order, 0)){
			SDKDemo.send(contactTel, "尊敬的用户您好，您的订单已经通过审核，订单号为"+orderNo+"，可随时登录我司网站查看货物状态。");
			resp.getWriter().print(1);
		};
		resp.getWriter().close();
	}
	//后台审核不通过
	protected void refuseOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		String contactTel = req.getParameter("contactTel");
		String orderNo = req.getParameter("orderNo");
		Order order = new Order();
		order.setOrderId(orderId);
		if(orderService.updateOrderStatus(order, 8)){
			SDKDemo.send(contactTel, "抱歉，您申请的订单"+orderNo+"未能通过审核，具体原因请联系我司客服，谢谢。");
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
		order.setStatusId(6);
		Customer customer = new Customer();
		customer.setId(Integer.parseInt(customerId));
		Customer_client custClient= customerService.getClientBycust(customer);
		order.setClientId(custClient.getClientId());
		boolean back=customerOrderService.addCustomerOrder(order);
		Integer newOrder = (Integer)this.getServletContext().getAttribute("newOrder");
		newOrder = newOrder==null?0:newOrder;
		if(back) {
			newOrder++; 
			this.getServletContext().setAttribute("newOrder", newOrder);
		}
		resp.getWriter().print(back);
	}
	//查看新订单数量
	protected void getNewOrderCount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer newOrder = (Integer)this.getServletContext().getAttribute("newOrder");
		newOrder = newOrder==null?0:newOrder;
		resp.getWriter().print(newOrder);
		resp.getWriter().close();
	}
	//申请绑定公司
		protected void bindingCompany (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String clientName=req.getParameter("clientName");
			String clientAddress=req.getParameter("clientAddress");
			String customerId=req.getParameter("customerId");
			String realName = req.getParameter("realName");
			Customer cust1 = new Customer();
			cust1.setId(Integer.parseInt(customerId));
			cust1.setRealName(realName);
			customerService.updateRealNameByCustomer(cust1);
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
			int totalRow = customerCostService.getPayOrderCountByCustomerId(customer);
			int totalPage = totalRow%6==0?totalRow/6:totalRow/6+1;
			if(curPage==null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(curPage);
				currentPage = currentPage<1?1:currentPage;
				currentPage = currentPage>totalPage?totalPage:currentPage;
			}
			List<Order_cost> payorderList = customerCostService.getPayOrderByCustomerId(customer, currentPage, 6);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("orderList", payorderList);
			req.getRequestDispatcher("/payorder.jsp").forward(req, resp);
		}
		//付款成功
		protected void payOrdersSuccess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int costId = Integer.parseInt(req.getParameter("costId"));
			if(customerCostService.updateCostStatus(costId, 3)) {
				resp.getWriter().print(1);
			};
			resp.getWriter().close();
		}
}
