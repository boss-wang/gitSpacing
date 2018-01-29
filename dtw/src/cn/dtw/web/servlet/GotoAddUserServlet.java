package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Role;
import cn.dtw.service.RoleService;
import cn.dtw.service.impl.RoleServiceImpl;
@WebServlet("/gotoaddUser")
public class GotoAddUserServlet extends HttpServlet {
	RoleService rs=new RoleServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Role> list=new ArrayList<Role>();
		list=rs.getAllRole();
		req.setAttribute("rolelist", list);
		req.getRequestDispatcher("admin/addUser.jsp").forward(req, resp);
	}
	
}
