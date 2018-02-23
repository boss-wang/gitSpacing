//员工管理
package cn.dtw.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.UserHeadSculpture;
import cn.dtw.entity.User_role;
import cn.dtw.service.RoleService;
import cn.dtw.service.UserService;
import cn.dtw.service.User_roleService;
import cn.dtw.service.impl.RoleServiceImpl;
import cn.dtw.service.impl.UserServiceImpl;
import cn.dtw.service.impl.User_roleServiceImpl;

@WebServlet("/user.do")
public class UserServlet extends BaseServlet {

	private static final long serialVersionUID = 4873569688893382991L;
	private UserService userService = new UserServiceImpl();
	private RoleService rs=new RoleServiceImpl();
	private User_roleService userRoleService = new User_roleServiceImpl();
	
	//显示员工列表
	protected void showUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	
	//跳转添加用户页面
	protected void goAddUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Role> list=new ArrayList<Role>();
		list=rs.getAllRole();
		req.setAttribute("rolelist", list);
		req.getRequestDispatcher("admin/addUser.jsp").forward(req, resp);
	}
	
	//添加用户
	protected void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//页面传来的数据：
		String userAccount=req.getParameter("userAccount");
		String password=req.getParameter("userPwd");
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
		
		if(userService.getUserByAccount(user)==null) {
			//添加用户及职位，均成功返回2，用户成功职位失败返回1，失败返回0
			int rs = userService.addUser(user, role);
			resp.getWriter().print(rs);
		}else {
			resp.getWriter().print(3);	//用户名存在返回3
		}
	}
	
	//删除用户
	protected void delUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		//2：用户及其职位均删除成功 //1：用户删除成功，职位删除失败 //0：删除失败
		int count=userService.deleteUser(Integer.parseInt(userId));
		resp.getWriter().print(count);
	}
	
	//根据页面传来的用户id获得用户职位信息，并跳转到修改职位页面
	protected void goUpdateRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	
	//添加用户的角色
		protected void addRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			User_role userRole = new User_role();
			int roleId = Integer.parseInt(req.getParameter("roleId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			userRole.setRoleId(roleId);
			userRole.setUserId(userId);
			User user = new User();
			user.setUserId(userId);
			
			List<Role> roleList = userRoleService.getRoleByUserId(user);
			int rs = 0;				//添加失败返回0
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
		//删除用户的角色
		protected void delRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		protected void showAllHeadPic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String userid = req.getParameter("userid");
			User user = new User();
			user.setUserId(Integer.parseInt(userid));
			List<UserHeadSculpture> list= userService.getAllPicPathById(user);
			req.setAttribute("list", list);
			req.getRequestDispatcher("admin/headSculpture.jsp").forward(req, resp);
		}
}
