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

@WebServlet("/updateSupplier")
public class UpdateSupplierServlet extends HttpServlet {
	private SupplierService supSer = new SupplierServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		String supplierName = req.getParameter("supplierName");
		String supplierAddress = req.getParameter("supplierAddress");
		Supplier supplier = new Supplier();
		supplier.setSupplierId(supplierId);
		supplier.setSupplierName(supplierName);
		supplier.setSupplierAddress(supplierAddress);
		//修改供应商,若公司名存在则返回0，若修改失败返回2，修改成功返回1
		int rs = supSer.updateSupplier(supplier);
		resp.getWriter().print(rs);
	}

}
