package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.UserHeadSculpture;

public interface UserDao {
	//获取所有用户信息
	public List<User> getAllUser();
	//通过Id获取用户信息
	public User getUserById(User user);
	//通过账号获取用户信息
	public User getUserByAccount(User user);
	//通过ID修改用户信息
	public boolean updateUserById(User user);

	//添加用户账号 获得创建用户ID
	public int addUser(User user);
	//分页
	public List<User> getAllUser(int start,int rowsize);
	//搜索员工列表
	public List<User> searchUser(String searchContent,int start,int rowsize);
	//总数
	public int getAllTotal();
	//搜索的总条数
	public int searchAllTotal(String searchContnet);
	//删除员工账号
	public int deleteUser(int userId);
	
	//根据用户id获取所有头像路径
	List<UserHeadSculpture> getAllPicPathById(User user);
	//根据用户id和图片id修改头像
	int updateHeadPic(User user,UserHeadSculpture userHeadSculpture);
	//根据用户id添加图片路径
	int addUserHeadPic(UserHeadSculpture userHeadSculpture);
}
