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

@WebServlet("/delSupplier")
public class DelSupplierServlet extends HttpServlet {

	private static final long serialVersionUID = -7659416009230193558L;
	private SupplierService supServ = new SupplierServiceImpl();
	
	//删除供应商及其联系人
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		Supplier supplier = new Supplier();
		supplier.setSupplierId(supplierId);
		int rs = supServ.delSupplier(supplier);
		resp.getWriter().print(rs);
	}

}
