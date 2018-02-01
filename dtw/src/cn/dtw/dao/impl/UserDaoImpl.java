package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.UserDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List<User> getAllUser() {
		String sql = "select * from user where userStatus=1 ";
		return super.executeQuery(new BeanListHandler<User>(User.class), sql);
	}

	@Override
	public User getUserById(User user) {
		String sql = "select * from user where userId=? ";
		return super.executeOneRow(new BeanHandler<User>(User.class), sql, user.getUserId());
	}

	@Override
	public User getUserByAccount(User user) {
		String sql = "select * from user where userAccount=?";
		return super.executeOneRow(new BeanHandler<User>(User.class), sql, user.getUserAccount());
	}

	@Override
	public boolean updateUserById(User user) {
		String sql  = "update user set userPwd=?,userName=?,userSex=? where userId=?";
		int res =	 super.executeUpdate(sql, user.getUserPwd(),user.getUserName(),user.getUserSex(),user.getUserId());
		return res>0?true:false;
	}
	//获得创建用户ID
	@Override
	public int addUser(User user) {
		String sql="insert into user(userAccount,userPwd,userName,userSex,userStatus) values(?,?,?,?,1)";
		int id = super.executeUpdateAndReturnId(sql, user.getUserAccount(),user.getUserPwd(),user.getUserName(),user.getUserSex());
		return id;
	}
	//分页查询用户
	@Override
	public List<User> getAllUser(int start, int rowsize) {
		User_roleDao userRoleDao = new User_roleDaoImpl();
		String sql = "select * from user where userStatus=1 order by userId desc limit ?,?";
		List<User> list = super.executeQuery(new BeanListHandler<User>(User.class), sql, start,rowsize);
		List<User> userList = new ArrayList<User>();
		for(User user:list) {
			//获得用户的职位信息
			List<Role> roleList = userRoleDao.getRoleIdByUserId(user);
			user.setRoles(roleList);
			userList.add(user);
		}
		return userList;
	}
	//查询所有记录条数
	@Override
	public int getAllTotal() {
		String sql = "select count(1) as count from user where userStatus=1 ";
		Long total = (Long)super.executeOneColumn(new ScalarHandler("count"), sql);
		return total.intValue();
	}
	//删除员工账号
	@Override
	public int deleteUser(int userId) {
		String sql="delete from user where userId=?";
		return super.executeUpdate(sql, userId);
	}

}
