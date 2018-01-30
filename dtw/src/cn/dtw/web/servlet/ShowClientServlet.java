package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Client;
import cn.dtw.service.ClientService;
import cn.dtw.service.impl.ClientServiceImpl;
@WebServlet("/showClient")
public class ShowClientServlet extends HttpServlet {
	private ClientService clientserv = new ClientServiceImpl(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String currentpage=req.getParameter("currentpage");
		int rowsize = 3;
		int totalPage=clientserv.getAllTotalPage(rowsize);
		Integer curpage;
		if(currentpage!=""&&currentpage!=null) {
			curpage=Integer.parseInt(currentpage)>totalPage?totalPage:Integer.parseInt(currentpage);
			curpage=Integer.parseInt(currentpage)<=0?1:curpage;
		}else {
			curpage=new Integer(1);
		}

		req.setAttribute("totalPage", totalPage);
		req.setAttribute("curpage", curpage);
		 List<Client> list=clientserv.getAllClient(curpage, rowsize);
		req.setAttribute("list", list);
		req.getRequestDispatcher("admin/updateClient.jsp").forward(req, resp);
	}

}
