package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.service.UserService;
import cn.dtw.service.impl.UserServiceImpl;
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	UserService us=new UserServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=req.getParameter("userId");
		//2：用户及其职位均删除成功 //1：用户删除成功，职位删除失败 //0：删除失败
		int count=us.deleteUser(Integer.parseInt(userId));
		resp.getWriter().print(count);
	}
}
