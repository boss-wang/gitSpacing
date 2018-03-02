package cn.dtw.web.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Order;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
import cn.dtw.service.CostStatusService;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.customerservice.CustomerService;
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
		Customer customer = new Customer();
		List<Terms> termsList = orderService.getAllTerms();
		List<Clientcontact> clientcontactList = customerService.getAllContactIdByClientId(customer);
		req.setAttribute("termsList", termsList);
		req.setAttribute("clientcontactList", clientcontactList);
		req.getRequestDispatcher("").forward(req, resp);
	}
}
