package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;
import cn.dtw.service.UserService;
import cn.dtw.service.User_roleService;
import cn.dtw.service.impl.UserServiceImpl;
import cn.dtw.service.impl.User_roleServiceImpl;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
	UserService us=new UserServiceImpl();
	User_roleService urs=new User_roleServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//页面传来的数据：
		//"userAccount="+userAccount+"&userPwd="+userPwd+"&userName="+userName+"&userSex="+userSex+"&roleId="+roleId
		String userAccount=req.getParameter("userAccount");
		String password=req.getParameter("password");
		String userName=req.getParameter("userName");
		String userSex=req.getParameter("userSex");
		String roleId=req.getParameter("roleId");
		User user=new User();
		Role role=new Role();
		user.setUserAccount(userAccount);
		user.setUserPwd(password);
		user.setUserName(userName);
		user.setUserSex(userSex);
		role.setRoleId(Integer.parseInt(roleId));
		us.addUser(user, role);
	}

}
