package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.User;
import cn.dtw.service.UserService;
import cn.dtw.service.impl.UserServiceImpl;
import cn.dtw.util.MD5;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		//为登录的用户创建用户对象
		User userLogin = new User();
		String userAccount = req.getParameter("userName");
		String password = req.getParameter("password");
		userLogin.setUserAccount(userAccount);
		userLogin.setUserPwd(password);
		//使用登录的账号去数据库中查询
		User userDB = userService.getUserByAccount(userLogin);
		if(userDB==null) {
			//没有找到此账号，返回0
			resp.getWriter().print(0);
		}else if(!MD5.KL(userDB.getUserPwd()).equals(MD5.toMD5(userLogin.getUserPwd()))) {
			//找到用户，但密码不正确，返回1
			resp.getWriter().print(1);
		}else {
			//登录成功,session中保存用户信息
			User user2 = userService.getUserById(userDB);
			req.getSession().setAttribute("user", user2);
			resp.getWriter().print(2);
		}
	}

}
