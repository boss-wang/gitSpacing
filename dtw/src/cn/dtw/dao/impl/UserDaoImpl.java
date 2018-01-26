package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.UserDao;
import cn.dtw.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List<User> getAllUser() {
		String sql = "select userId,userAccount,userName,userSex,userPwd from user ";
		ResultSet res=  super.executeQuery(sql);
		List<User> list = new ArrayList<User>();
		
		try {
			while(res.next()) {
				User user = new User();
				user.setUserAccount(res.getString("userAccount"));
				user.setUserPwd(res.getString("userPwd"));
				user.setUserName(res.getString("userName"));
				user.setUserSex(res.getString("userSex"));
				user.setUserId(res.getInt("userId"));
				list.add(user);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User getUserById(User user) {
		String sql = "select * from user where userId=? ";
	 ResultSet res =super.executeQuery(sql, user.getUserId());
	 try {
		while(res.next()) {
			User user2 =  new User();
			user2.setUserAccount(res.getString("userAccount"));
			user2.setUserPwd(res.getString("userPwd"));
			user2.setUserName(res.getString("userName"));
			user2.setUserSex(res.getString("userSex"));
			user2.setUserId(res.getInt("userId"));
			return user2;
		};
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return null;
	}

	@Override
	public User getUserByAccount(User user) {
		String sql = "select * from user where userAccount=?";
		ResultSet res=	super.executeQuery(sql, user.getUserAccount());
		try {
			while(res.next()) {
				User user2 =  new User();
				user2.setUserAccount(res.getString("userAccount"));
				user2.setUserPwd(res.getString("userPwd"));
				user2.setUserName(res.getString("userName"));
				user2.setUserSex(res.getString("userSex"));
				user2.setUserId(res.getInt("userId"));
				return user2;
		};
		 
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return null;
		}

	@Override
	public boolean updateUserById(User user) {
		String sql  = "update user set userPwd=?,userName=?,userSex=? where userId=?";
		int res =	 super.executeUpdate(sql, user.getUserPwd(),user.getUserName(),user.getUserSex(),user.getUserId());
		if(res>0) {
			return true;
		}
			return false;
		}

}
