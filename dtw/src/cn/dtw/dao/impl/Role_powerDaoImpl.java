package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.Role_powerDao;
import cn.dtw.entity.Power;
import cn.dtw.entity.Role;

public class Role_powerDaoImpl extends BaseDao implements Role_powerDao {
	
	//根据角色id获取权限ID
	@Override
	public List<Power> getPowerIdByRoleId(Role role) {
		String sql="SELECT powerId FROM role_power WHERE roleId = ?";
		return super.executeQuery(new BeanListHandler<Power>(Power.class), sql, role.getRoleId());
	}
}
