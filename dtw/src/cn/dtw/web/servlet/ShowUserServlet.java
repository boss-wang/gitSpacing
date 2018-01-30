package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.dao.User_roleDao;
import cn.dtw.dao.impl.User_roleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.service.UserService;
import cn.dtw.service.impl.UserServiceImpl;

@WebServlet("/showUser")
public class ShowUserServlet extends HttpServlet {
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//查询员工列表
		String currentpage=req.getParameter("currentpage");
		int rowsize = 4;
		int totalPage=userService.TotalPage(rowsize);
		Integer curpage;
		if(currentpage!=""&&currentpage!=null) {
			curpage=Integer.parseInt(currentpage)>totalPage?totalPage:Integer.parseInt(currentpage);
			curpage=Integer.parseInt(currentpage)<=0?1:curpage;
		}else {
			curpage=new Integer(1);
		}

		req.setAttribute("totalPage", totalPage);
		req.setAttribute("curpage", curpage);
		List<User> userList = userService.getAllUser(curpage, rowsize);

		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/updateUser.jsp").forward(req, resp);

		}

}
