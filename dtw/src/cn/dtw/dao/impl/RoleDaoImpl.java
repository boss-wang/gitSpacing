package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.RoleDao;
import cn.dtw.entity.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {
	
	//查询所有角色信息
	@Override
	public List<Role> getAllRole() {
		String sql="select * from role";
		return super.executeQuery(new BeanListHandler<Role>(Role.class), sql);
	}
	
	//根据id获取职位信息
	@Override
	public Role getRoleById(int roleid) {
		String sql="select * from role where roleId=?";
		return super.executeOneRow(new BeanHandler<Role>(Role.class), sql, roleid);
	}

}
