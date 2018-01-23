package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.User;

public interface UserDao {
	//获取所有用户信息
	public List<User> getAllUser();
	//通过Id获取用户信息
	public User getUserById(User user);
	//通过账号获取用户信息
	public User getUserByAccount(User user);
	//通过ID修改用户信息
	public boolean updateUserById(User user);
}
