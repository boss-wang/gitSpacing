package cn.dtw.service.impl;

import cn.dtw.dao.User_roleDao;
import cn.dtw.dao.impl.User_roleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;
import cn.dtw.service.User_roleService;

public class User_roleServiceImpl implements User_roleService {
	User_roleDao urd=new User_roleDaoImpl();
	@Override
	public boolean addUserRoleById(User_role userRole) {
		// TODO Auto-generated method stub
		return urd.addUserRoleById(userRole);
	}
	@Override
	public boolean delUserRoleById(User_role userRole) {
		// TODO Auto-generated method stub
		return urd.delUserRoleById(userRole);
	}

}
