package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.dao.ClientDao;
import cn.dtw.dao.UserDao;
import cn.dtw.dao.impl.ClientDaoImpl;
import cn.dtw.dao.impl.UserDaoImpl;
import cn.dtw.entity.User;
import cn.dtw.service.OrderService;
import cn.dtw.service.SupplierService;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.service.impl.OrderServiceImpl;
import cn.dtw.service.impl.SupplierServiceImpl;

@WebServlet("/search.do")
public class SearchServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderServiceImpl();
	private CustomerService customerService = new CustomerServiceImpl();
	private ClientDao clientDao = new ClientDaoImpl();
	private SupplierService suService = new SupplierServiceImpl();
	private UserDao userDao = new UserDaoImpl();
	
	//搜索全文
	protected void defaultSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchContent = req.getParameter("serchContent");
		//搜索本人添加的订单
		User user = (User)req.getSession().getAttribute("user");
		int totalRow = orderService.searchOrderCount(searchContent, user);
		if(totalRow>0) {
			req.getRequestDispatcher("/order.do?mn=searchOrder").forward(req, resp);
		}else {
			//搜索客户自助下单
			User user1 = new User();
			user1.setUserId(0);
			totalRow = orderService.searchOrderCount(searchContent, user1);
			if(totalRow>0) {
				req.getRequestDispatcher("/order.do?mn=searchCustomerOrders").forward(req, resp);
			}else {
				//搜索注册的用户
				totalRow = customerService.searchCustomerCount(searchContent);
				if(totalRow>0) {
					req.getRequestDispatcher("/customer.do?mn=searchCustomerApplication").forward(req, resp);
				}else {
					//搜索客户信息
					totalRow = clientDao.getSearchTotalClient(searchContent);
					if(totalRow>0) {
						req.getRequestDispatcher("/client.do?mn=searchClient").forward(req, resp);
					}else {
						//搜索供应商信息
						totalRow = suService.getSearchRowOfSupplier(searchContent);
						if(totalRow>0) {
							req.getRequestDispatcher("/supplier.do?mn=searchSupplier").forward(req, resp);
						}else {
							//搜索员工
							totalRow = userDao.searchAllTotal(searchContent);
							if(totalRow>0) {
								req.getRequestDispatcher("/user.do?mn=searchUser").forward(req, resp);
							}else {
								req.getRequestDispatcher("/admin/noresult.jsp").forward(req, resp);
							}
						}
					}
				}
			}
		}
	}
}
