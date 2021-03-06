package cn.dtw.service;

import cn.dtw.entity.Role;
import java.util.List;

import cn.dtw.entity.User;
import cn.dtw.entity.UserHeadSculpture;

public interface UserService {
	//查询账户是否存在，存在则将用户信息返回
	public User getUserByAccount(User user);
	//添加用户账号
	public int addUser(User user,Role role);
	//查询所有用户
	public List<User> getAllUser();
	//获得分页数据
	public List<User> getAllUser(int currentpage,int rowsize);
	//搜索员工列表
	public List<User> searchUser(String searchContent,int currentpage,int rowsize);
	//总页数
	public int TotalPage(int rowsize);
	//搜索的总页数
	public int searchTotalPage(String searchContent,int rowsize);
	//删除员工账号
	public int deleteUser(int userId);
	//通过Id获取用户信息
	public User getUserById(User user);
	//通过id获取所有头像
	List<UserHeadSculpture> getAllPicPathById(User user);
	//根据用户id和图片id修改头像
	int updateHeadPic(User user,UserHeadSculpture userHeadSculpture);
	//根据用户id添加图片路径
	int addUserHeadPic(UserHeadSculpture userHeadSculpture);
}
