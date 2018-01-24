package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;

public class User_roleDaoImpl extends BaseDao implements User_roleDao {

	@Override
	public boolean addUserRoleById(User user, Role role) {
		String sql = "insert into user_role (userId,roleId) values(?,?)";
		int res= super.executeUpdate(sql, user.getUserId(),role.getRoleId());
		if(res>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delUserRoleById(User user, Role role) {
		String sql="Delete from user_role where userId=?";
		int res = super.executeUpdate(sql, user.getUserId());
		if(res>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Role> getRoleIdByUserId(User user) {
		String sql ="select roleId from user_role where userId=?";
		ResultSet res= super.executeQuery(sql, user.getUserId());
		List<Role> list = new ArrayList<Role>();
		try {
			while(res.next()) {
				Role role = new Role();
				role.setRoleId(res.getInt("roleId"));
				list.add(role);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
