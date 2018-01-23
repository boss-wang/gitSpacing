package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Power;
import cn.dtw.entity.Role;

public interface Role_powerDao {
	//根据角色id获取权限ID
	public List<Power> getPowerIdByRoleId(Role role);
}
