package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;
import cn.dtw.service.User_roleService;
import cn.dtw.service.impl.User_roleServiceImpl;

@WebServlet("/addUserRole")
public class addUserRoleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	//删除用户的角色
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User_roleService userRoleService = new User_roleServiceImpl();
		User_role userRole = new User_role();
		int roleId = Integer.parseInt(req.getParameter("roleId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		userRole.setRoleId(roleId);
		userRole.setUserId(userId);
		User user = new User();
		user.setUserId(userId);
		
		
		List<Role> roleList = userRoleService.getRoleByUserId(user);
		int rs = 0;				//删除失败返回0
		//判断数据库中是否存在此角色
		boolean hasRole = false;
		for(Role role:roleList) {
			if(role.getRoleId()==roleId) {
				hasRole=true;
				break;
			};
		}
		//确认数据库中没有此角色才执行添加
		if(!hasRole) {
			if(userRoleService.addUserRoleById(userRole)) {
				rs = 1;			//添加成功返回1
			};
		}
		resp.getWriter().print(rs);
	}

}
