package cn.dtw.web.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Leavemessage;
import cn.dtw.service.ClientContactService;
import cn.dtw.service.ClientService;
import cn.dtw.service.LeaveMessageService;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.Customer_ClientService;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.service.customerservice.impl.Customer_ClientServiceImpl;
import cn.dtw.service.impl.ClientContactServiceImpl;
import cn.dtw.service.impl.ClientServiceImpl;
import cn.dtw.service.impl.LeaveMessageServiceImpl;
import cn.dtw.util.phone.SDKDemo;
import cn.dtw.web.servlet.BaseServlet;

@WebServlet("/customer.do")
public class CustomerServlet extends BaseServlet {

	private static final long serialVersionUID = 335282468601497196L;
	private CustomerService customerService = new CustomerServiceImpl();
	private LeaveMessageService messageService = new LeaveMessageServiceImpl();
	private ClientService clientService = new ClientServiceImpl();
	private ClientContactService clientContactService = new ClientContactServiceImpl();
	private Customer_ClientService customerClientService = new Customer_ClientServiceImpl();
	//显示注册的客户
	protected void showCustomerApplication(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		int totalRow = customerService.getCustomerCount();
		int totalPage = totalRow%10==0?totalRow/10:totalRow/10+1;
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Customer> customerList = customerService.getCustomerList(currentPage, 10);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("customerList", customerList);
		req.getRequestDispatcher("/admin/CustomerApplication.jsp").forward(req, resp);
	}
	//显示留言信息
	protected void showCustomerLeaveMessage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		int rowsize=5;
		int totalPage =messageService.getAllTotalPage(rowsize);
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Leavemessage> messageList = messageService.showMessage(currentPage, rowsize);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("messageList", messageList);
		req.getRequestDispatcher("/admin/leaveMessage.jsp").forward(req, resp);
	}
	//同意绑定公司申请
	protected void passBindingCompany(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int customerId = Integer.parseInt(req.getParameter("customerId"));
		String clientName = req.getParameter("clientName");
		
		Client client = new Client();
		client.setClientName(clientName);
		client = clientService.getClientByName(client);
		Customer customer = customerService.getCustomerByid(customerId);
		//通过手机号码判断客户联系人是否存在，不存在则添加
		boolean flag = false;
		for(Clientcontact contact:client.getClientContactlist()) {
			if(contact.getClientContactTel().equals(customer.getTel())) {
				flag = true;
			};
		}
		if(!flag) {
			clientContactService.addCustomerContact(client, customer);
		}
		//绑定客户id到对应的公司id
		if(customerClientService.addCustomer_client(customer,client)) {
			if(customerService.updateCustomerStatus(customer, 3)) {
				SDKDemo.send(customer.getTel(), "尊敬的用户您好，我们已收到您的报名申请，并核准通过，请您准时前来签到，感谢您的参与。");
				resp.getWriter().print(1);
			}
		};
		resp.getWriter().close();
	}
}
