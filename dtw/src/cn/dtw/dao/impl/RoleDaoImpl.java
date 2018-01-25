package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.RoleDao;
import cn.dtw.entity.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {
	
	//获取角色信息
	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		String sql="select * from role";
		ResultSet rs=super.executeQuery(sql);
		List<Role> list=new ArrayList<Role>();
		try {
			while(rs.next()) {
				Role role=new Role();
				role.setRoleId(rs.getInt("roleId"));
				role.setRoleName(rs.getString("roleName"));
				list.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//根据id获取角色信息
	@Override
	public Role getRoleById(Role role) {
		// TODO Auto-generated method stub
		String sql="select * from role where roleId=?";
		ResultSet rs=super.executeQuery(sql,role.getRoleId());
		try {
			while(rs.next()) {
				Role rl=new Role();
				rl.setRoleId(rs.getInt("roleId"));
				rl.setRoleName(rs.getString("roleName"));
				return rl;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
