package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.RoleDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.User_role;

public class User_roleDaoImpl extends BaseDao implements User_roleDao {

	//添加用户-角色
	@Override
	public boolean addUserRoleById(User_role userRole) {
		String sql = "insert into user_role (userId,roleId) values(?,?)";
		int res= super.executeUpdate(sql, userRole.getUserId(),userRole.getRoleId());
		super.closeRes();
		if(res>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delUserRoleById(User_role userRole) {
		String sql="Delete from user_role where userId=?";
		int res = super.executeUpdate(sql, userRole.getUserId());
		super.closeRes();
		if(res>0) {
			return true;
		} 
		return false;
	}

	@Override
	public List<Role> getRoleIdByUserId(User user) {
		String sql ="select role.roleId as id,roleName from user_role,role where user_role.roleId=role.roleId and userId=?";
		ResultSet res= super.executeQuery(sql, user.getUserId());
		List<Role> list = new ArrayList<Role>();
		try {
			while(res.next()) {
				Role role = new Role();
				role.setRoleId(res.getInt("id"));
				role.setRoleName(res.getString("roleName"));
				list.add(role);
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
