package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;

public interface User_roleDao {
	//添加用户角色
	public boolean addUserRoleById(User_role userRole);
	//删除用户角色
	public boolean delUserRoleById(User_role userRole);
	//根据用户ID查询用户角色ID
	public List<Role> getRoleIdByUserId(User user);
}
