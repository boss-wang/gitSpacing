package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.Supplier_contactService;
import cn.dtw.service.impl.Supplier_contactServiceImpl;

@WebServlet("/modifySupplierContact")
public class UpdateSupplierContactServlet extends HttpServlet {
	private Supplier_contactService supplierContactSer = new Supplier_contactServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//"email="+email+"&qq="+qq,
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String qq = req.getParameter("qq");
		Suppliercontact suppliercontact = new Suppliercontact();
		suppliercontact.setSupplierContactEmail(email);
		suppliercontact.setSupplierContactId(contactId);
		suppliercontact.setSupplierContactQQ(qq);
		suppliercontact.setSupplierContactTel(tel);
		
		int rs = supplierContactSer.updateSupplierContact(suppliercontact);
		resp.getWriter().print(rs);
	}

}
