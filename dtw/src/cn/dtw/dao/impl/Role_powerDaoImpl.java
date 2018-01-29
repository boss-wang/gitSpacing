package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.Role_powerDao;
import cn.dtw.entity.Power;
import cn.dtw.entity.Role;

public class Role_powerDaoImpl extends BaseDao implements Role_powerDao {
	
	//根据角色id获取权限ID
	@Override
	public List<Power> getPowerIdByRoleId(Role role) {
		// TODO Auto-generated method stub
		String sql="SELECT powerId FROM role_power WHERE roleId = ?";
		ResultSet rs=super.executeQuery(sql,role.getRoleId());
		List<Power> list=new ArrayList<Power>();
		try {
			while(rs.next()) {
				Power power=new Power();
				power.setPowerId(rs.getInt("powerId"));
				power.setPowerName(rs.getString("powerName"));
				list.add(power);
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
