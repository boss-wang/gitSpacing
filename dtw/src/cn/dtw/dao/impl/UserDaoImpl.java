package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.UserDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List<User> getAllUser() {
		String sql = "select userId,userAccount,userName,userSex,userPwd from user where userStatus=1 ";
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
				//获得用户的职位信息
				User_roleDao userRoleDao = new User_roleDaoImpl();
				List<Role> roleList = userRoleDao.getRoleIdByUserId(user);
				user.setRoles(roleList);
				
				list.add(user);
			}
			super.closeRes();
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
			super.closeRes();
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
				super.closeRes();
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
		super.closeRes();
		if(res>0) {
			return true;
		}
			return false;
		}
	//获得创建用户ID
	@Override
	public int addUser(User user) {
		String sql="insert into user(userAccount,userPwd,userName,userSex,userStatus) values(?,?,?,?,1)";
		int id = super.executeUpdateAndReturnId(sql, user.getUserAccount(),user.getUserPwd(),user.getUserName(),user.getUserSex());
		super.closeRes();
		return id;
	}
	//分页
	@Override
	public List<User> getAllUser(int start, int rowsize) {
		User_roleDao userRoleDao = new User_roleDaoImpl();
		String sql = "select * from user where userStatus=1 limit ?,?";
		ResultSet res=  super.executeQuery(sql,start,rowsize);
		List<User> list = new ArrayList<User>();
		try {
			while(res.next()) {
				User user = new User();
				user.setUserId(res.getInt("userId"));
				user.setUserAccount(res.getString("userAccount"));
				user.setUserPwd(res.getString("userPwd"));
				user.setUserName(res.getString("userName"));
				user.setUserSex(res.getString("userSex"));
				//获得用户的职位信息
				List<Role> roleList = userRoleDao.getRoleIdByUserId(user);
				user.setRoles(roleList);
				
				list.add(user);
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getAllTotal() {
		String sql = "select count(*) as count from user where userStatus=1 ";
		ResultSet res= super.executeQuery(sql);
		int count = 0;
		try {
			while(res.next()) {
				count=res.getInt("count");
			}
			super.closeRes();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
//删除员工账号
	@Override
	public int deleteUser(int userId) {
		// TODO Auto-generated method stub
		String sql="delete from user where userId=?";
		return super.executeUpdate(sql, userId);
	}

}
