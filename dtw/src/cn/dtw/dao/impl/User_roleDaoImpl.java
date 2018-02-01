package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

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
		return res>0?true:false;
	}
	//删除用户-角色
	@Override
	public boolean delUserRoleById(User_role userRole) {
		String sql="Delete from user_role where userId=?";
		int res = super.executeUpdate(sql, userRole.getUserId());
		return res>0?true:false;
	}
	//通过用户ID获得其角色ID
	@Override
	public List<Role> getRoleIdByUserId(User user) {
		String sql ="select role.roleId as roleId,roleName from user_role,role where user_role.roleId=role.roleId and userId=?";
		return super.executeQuery(new BeanListHandler<Role>(Role.class), sql, user.getUserId());
	}

}
