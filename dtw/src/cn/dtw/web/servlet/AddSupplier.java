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

@WebServlet("/addSupplier")
public class AddSupplier extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SupplierService supplierService = new SupplierServiceImpl();
		Supplier newSupplier = new Supplier();
		String supplierName = req.getParameter("supplierName");
		String supplierAddress = req.getParameter("supplierAddress");
		newSupplier.setSupplierName(supplierName);
		newSupplier.setSupplierAddress(supplierAddress);
		//判断供应商抬头是否已经存在，如存在则不执行添加，并返回0；否则添加供应商，成功返回1，失败返回2
		int rs = 0;
		if(supplierService.getSupplierByName(newSupplier)==null) {
			if(supplierService.addSupplier(newSupplier)) {
				rs = 1;
			}else{
				rs = 2;
			};
		};
		resp.getWriter().print(rs);
	}

}
