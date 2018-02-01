package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.User_roleDao;
import cn.dtw.dao.impl.User_roleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;
import cn.dtw.service.User_roleService;

public class User_roleServiceImpl implements User_roleService {
	User_roleDao urd=new User_roleDaoImpl();
	//添加用户角色
	@Override
	public boolean addUserRoleById(User_role userRole) {
		return urd.addUserRoleById(userRole);
	}
	//根据用户删除其所有角色
	@Override
	public boolean delUserRoleById(User_role userRole) {
		return urd.delUserRoleById(userRole);
	}
	
	@Override
	public List<Role> getRoleByUserId(User user) {
		return urd.getRoleByUserId(user);
	}
	//删除单个角色
	@Override
	public boolean delSingleUserRole(User_role userRole) {
		return urd.delSingleUserRole(userRole);
	}

}
