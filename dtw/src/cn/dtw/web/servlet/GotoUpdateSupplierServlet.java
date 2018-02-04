package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Supplier;
import cn.dtw.service.SupplierService;
import cn.dtw.service.impl.SupplierServiceImpl;
@WebServlet("/gotoUpdateSupplier")
public class GotoUpdateSupplierServlet extends HttpServlet {
	private SupplierService supSer = new SupplierServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	//获取供应商信息，跳转供应商页面
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String supplierId = req.getParameter("supplierId");
		String currentPage = req.getParameter("currentPage");
		Supplier supplier = new Supplier();
		supplier.setSupplierId(Integer.parseInt(supplierId));
		supplier = supSer.getSupplierById(supplier);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("supplier", supplier);
		req.getRequestDispatcher("admin/updateSupplierAddress.jsp").forward(req, resp);
		
	}

}
