package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.RoleDao;
import cn.dtw.dao.impl.RoleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.service.RoleService;

public class RoleServiceImpl implements RoleService {
	RoleDao rd=new RoleDaoImpl();
	//获取角色信息
	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return rd.getAllRole();
	}
	//根据id获取角色信息

	@Override
	public Role getRoleById(int roleid) {
		// TODO Auto-generated method stub
		return rd.getRoleById(roleid);
	}
}
