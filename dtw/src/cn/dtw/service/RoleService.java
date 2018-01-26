package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Role;

public interface RoleService {
	//获取角色信息
	public List<Role> getAllRole();
	//根据id获取角色信息
	public Role getRoleById(int roleid);
}
