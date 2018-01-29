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
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//根据id获取职位信息
	@Override
	public Role getRoleById(int roleid) {
		// TODO Auto-generated method stub
		String sql="select * from role where roleId=?";
		ResultSet rs=super.executeQuery(sql,roleid);
		try {
			if(rs.next()) {
				Role role=new Role();
				role.setRoleId(rs.getInt("roleId"));
				role.setRoleName(rs.getString("roleName"));
				return role;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
