package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Role;

public interface RoleDao {
	//获取角色信息
	public List<Role> getAllRole();
	//根据id获取角色信息
	public Role getRoleById(Role role);
}
