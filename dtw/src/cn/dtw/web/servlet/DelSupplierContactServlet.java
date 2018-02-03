package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.service.Supplier_contactService;
import cn.dtw.service.impl.Supplier_contactServiceImpl;

@WebServlet("/delSupplierContact")
public class DelSupplierContactServlet extends HttpServlet {
	Supplier_contactService supplierContactService = new Supplier_contactServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		Supplier_suppliercontact suppler_Contact = new Supplier_suppliercontact();
		suppler_Contact.setSupplierContactId(contactId);
		suppler_Contact.setSupplierId(supplierId);
		int rs = supplierContactService.delSupplierContact(suppler_Contact);
		resp.getWriter().print(rs);
	}
	
}
