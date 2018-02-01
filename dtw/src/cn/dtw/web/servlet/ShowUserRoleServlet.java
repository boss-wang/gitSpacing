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
import cn.dtw.entity.User;
import cn.dtw.service.RoleService;
import cn.dtw.service.UserService;
import cn.dtw.service.impl.RoleServiceImpl;
import cn.dtw.service.impl.UserServiceImpl;

@WebServlet("/showUserRole")
public class ShowUserRoleServlet extends HttpServlet {
	UserService userService = new UserServiceImpl();
	RoleService rs=new RoleServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	//根据页面传来的用户id获得用户职位信息，并跳转到修改职位页面
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//加入所有的职位列表
		List<Role> list=new ArrayList<Role>();
		list=rs.getAllRole();
		req.setAttribute("rolelist", list);
		//获取对应的用户信息
		int userId = Integer.parseInt(req.getParameter("userId"));
		User user = new User();
		user.setUserId(userId);
		User userGet = userService.getUserById(user);
		req.setAttribute("user", userGet);
		
		req.getRequestDispatcher("admin/updateUserRole.jsp").forward(req, resp);
	}

}
