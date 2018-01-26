package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.User;
import cn.dtw.service.UserService;
import cn.dtw.service.impl.UserServiceImpl;

@WebServlet("/showUser")
public class ShowUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//查询员工列表
		UserService userService = new UserServiceImpl();
		List<User> userList = userService.getAllUser();
		req.setAttribute("userList", userList);
		System.out.println("f32");
	}

}
