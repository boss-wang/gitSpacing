package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Supplier;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.SupplierService;
import cn.dtw.service.Supplier_contactService;
import cn.dtw.service.impl.SupplierServiceImpl;
import cn.dtw.service.impl.Supplier_contactServiceImpl;
@WebServlet("/supplier.do")
public class SupplierServlet extends BaseServlet {
	private SupplierService suService = new SupplierServiceImpl();
	private Supplier_contactService supplierContactService = new Supplier_contactServiceImpl();
	//显示供应商
	protected void showSupplier(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("currentPage");
		int currentPage;
		int totalRow = suService.getTotalRowOfSupplier();
		int totalPage = totalRow%3==0?totalRow/3:totalRow/3+1;
		if(curPage==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(curPage);
			currentPage = currentPage<1?1:currentPage;
			currentPage = currentPage>totalPage?totalPage:currentPage;
		}
		List<Supplier> supplierList = suService.getPageSupplier(currentPage, 3);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("supplierList", supplierList);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("/admin/updateSupplier.jsp").forward(req, resp);
	}
	
	//删除供应商联系人
	protected void delContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		Supplier_suppliercontact suppler_Contact = new Supplier_suppliercontact();
		suppler_Contact.setSupplierContactId(contactId);
		suppler_Contact.setSupplierId(supplierId);
		int rs = supplierContactService.delSupplierContact(suppler_Contact);
		resp.getWriter().print(rs);
	}
	//修改供应商联系人
	protected void updateContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String qq = req.getParameter("qq");
		Suppliercontact suppliercontact = new Suppliercontact();
		suppliercontact.setSupplierContactEmail(email);
		suppliercontact.setSupplierContactId(contactId);
		suppliercontact.setSupplierContactQQ(qq);
		suppliercontact.setSupplierContactTel(tel);
		
		int rs = supplierContactService.updateSupplierContact(suppliercontact);
		resp.getWriter().print(rs);
	}
	
	//获取供应商信息，跳转供应商页面
	protected void goUpdateSullier(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String supplierId = req.getParameter("supplierId");
		String currentPage = req.getParameter("currentPage");
		Supplier supplier = new Supplier();
		supplier.setSupplierId(Integer.parseInt(supplierId));
		supplier = suService.getSupplierById(supplier);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("supplier", supplier);
		req.getRequestDispatcher("admin/updateSupplierAddress.jsp").forward(req, resp);
		
	}
	
		//删除供应商及其联系人
		protected void delSupplier(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int supplierId = Integer.parseInt(req.getParameter("supplierId"));
			Supplier supplier = new Supplier();
			supplier.setSupplierId(supplierId);
			int rs = suService.delSupplier(supplier);
			resp.getWriter().print(rs);
		}
		
		//添加供应商
		protected void addSupplier(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			Supplier newSupplier = new Supplier();
			String supplierName = req.getParameter("supplierName");
			String supplierAddress = req.getParameter("supplierAddress");
			newSupplier.setSupplierName(supplierName);
			newSupplier.setSupplierAddress(supplierAddress);
			//判断供应商抬头是否已经存在，如存在则不执行添加，并返回0；否则添加供应商，成功返回1，失败返回2
			int rs = 0;
			if(suService.getSupplierByName(newSupplier)==null) {
				if(suService.addSupplier(newSupplier)) {
					rs = 1;
				}else{
					rs = 2;
				};
			};
			resp.getWriter().print(rs);
		}
		
		//添加联系人
		protected void addContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
			
			int rs = supplierContactService.addSupplierContact(supplier_Contact, supplierContact);
			resp.getWriter().print(rs);
		}
		
		//修改供应商信息
		protected void updateSupplier(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int supplierId = Integer.parseInt(req.getParameter("supplierId"));
			String supplierName = req.getParameter("supplierName");
			String supplierAddress = req.getParameter("supplierAddress");
			Supplier supplier = new Supplier();
			supplier.setSupplierId(supplierId);
			supplier.setSupplierName(supplierName);
			supplier.setSupplierAddress(supplierAddress);
			//修改供应商,若公司名存在则返回0，若修改失败返回2，修改成功返回1
			int rs = suService.updateSupplier(supplier);
			resp.getWriter().print(rs);
		}

}
