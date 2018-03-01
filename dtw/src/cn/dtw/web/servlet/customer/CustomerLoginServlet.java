package cn.dtw.web.servlet.customer;

import java.io.IOException;
import java.util.Random;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.impl.protocol.giopmsgheaders.ReplyMessage_1_0;

import cn.dtw.entity.Customer;
import cn.dtw.service.customerservice.CustomerService;
import cn.dtw.service.customerservice.impl.CustomerServiceImpl;
import cn.dtw.util.phone.SDKDemo;
import cn.dtw.web.servlet.BaseServlet;
@WebServlet("/custlogin.do")
public class CustomerLoginServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5781959352267918484L;
	private  SDKDemo phonesend = new SDKDemo();
	private CustomerService cusService = new  CustomerServiceImpl();
	//发送短信
	protected void sendMessage(HttpServletRequest req, HttpServletResponse resp) {
		String contentCode="";
		String phoneNumber=req.getParameter("phoneNumber");
		Random math = new Random();
		String[]m=new String[4];
		
		for(int i=0;i<4;i++) {
			m[i]=Integer.toString(math.nextInt(10));
			contentCode=contentCode+m[i];
		}
		phonesend.send(phoneNumber, contentCode);
		req.getSession().setAttribute("contentCode", contentCode);
	}
	//验证
	protected void islogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String phonecode = req.getParameter("phonecode");
		String loginName=req.getParameter("loginName");
		String loginPwd=req.getParameter("loginPwd");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		if(phonecode.equals(req.getSession().getAttribute("contentCode"))) {
			req.getSession().removeAttribute("contentCode");
			Customer cust = new Customer();
			cust.setLoginName(loginName);
			cust.setLoginPwd(loginPwd);
			cust.setTel(tel);
			cust.setEmail(email);
			cust.setStatusId(1);
			cusService.addCustomer(cust);
			resp.getWriter().print(1);
		}else {
			resp.getWriter().print(0);	
		}
	}
	//删除验证码
	protected void deleCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.getSession().removeAttribute("contentCode");
	}
	//验证用户名是否重复
	protected void isrepeat(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String loginName=req.getParameter("loginName");
		String tel=req.getParameter("tel");
		Customer customer = new Customer();
		customer.setLoginName(loginName);
		customer.setTel(tel);
		int back=0;
		if(cusService.getCustomer(customer)==null) {
			back=1;
		}else {
			 back=0;
		}
		resp.getWriter().print(back);
	}
	
	//登录
	protected void customerlogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String loginName=req.getParameter("loginName");
		String paswd=req.getParameter("paswd");
		Customer customer = new Customer();
		customer.setLoginName(loginName);
		customer.setEmail(loginName);
		customer.setTel(loginName);
		customer.setLoginPwd(paswd);
		int back= cusService.loginCustomer(customer);
		if(back==1) {
			Customer cust = cusService.getCustomer(customer);
			req.getSession().setAttribute("customer", cust);
		}
		resp.getWriter().print(back);
	}
}
