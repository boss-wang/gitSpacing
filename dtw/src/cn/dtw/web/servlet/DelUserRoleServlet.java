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

@WebServlet("/delUserRole")
public class DelUserRoleServlet extends HttpServlet {

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
		//角色必须大于1个才能执行
		int rs = 0;				//删除失败返回0
		if(roleList.size()>1) {
			//数据库中确认有此角色才能执行
			for(Role role:roleList) {
				if(role.getRoleId()==roleId) {
					if(userRoleService.delSingleUserRole(userRole)) {
						rs = 1;		//删除成功返回1
					};
				}
			}
		}
		resp.getWriter().print(rs);
	}

}
