package cn.dtw.service;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;

public interface User_roleService {
	//添加用户角色
	public boolean addUserRoleById(User_role userRole);
}
