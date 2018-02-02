package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Supplier;
import cn.dtw.service.SupplierService;
import cn.dtw.service.impl.SupplierServiceImpl;

@WebServlet("/showSupplier")
public class ShowSupplierServlet extends HttpServlet {
	SupplierService suService = new SupplierServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

}
