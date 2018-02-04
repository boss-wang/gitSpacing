package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.Supplier_contactService;
import cn.dtw.service.impl.Supplier_contactServiceImpl;
@WebServlet("/addSupplierContact")
public class AddSupplierContactServlet extends HttpServlet {
	private Supplier_contactService supplier_contactService= new Supplier_contactServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Suppliercontact supplierContact = new Suppliercontact();
		Supplier_suppliercontact supplier_Contact = new Supplier_suppliercontact();
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		supplier_Contact.setSupplierId(supplierId);
		
		String contactName = req.getParameter("contactName");
		String telephone = req.getParameter("telephone");
		String qq = req.getParameter("qq");
		String email = req.getParameter("email");
		
		supplierContact.setSupplierContactEmail(email);
		supplierContact.setSupplierContactName(contactName);
		supplierContact.setSupplierContactQQ(qq);
		supplierContact.setSupplierContactTel(telephone);
		
		int rs = supplier_contactService.addSupplierContact(supplier_Contact, supplierContact);
		resp.getWriter().print(rs);
	}

}
