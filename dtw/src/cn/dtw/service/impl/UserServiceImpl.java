package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.UserDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.dao.impl.UserDaoImpl;
import cn.dtw.dao.impl.User_roleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
import cn.dtw.entity.UserHeadSculpture;
import cn.dtw.entity.User_role;
import cn.dtw.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();
	User_roleDao urd=new User_roleDaoImpl();
	
	@Override
	public User getUserByAccount(User user) {
		User userGet = userDao.getUserByAccount(user);
		return userGet;
	}

	@Override
	public int addUser(User user,Role role) {
		 int userId=userDao.addUser(user);
		 if(userId!=0) {
			 User_role ur=new User_role();
			 ur.setUserId(userId);
			 ur.setRoleId(role.getRoleId());
			 if(urd.addUserRoleById(ur)) {
				 return 2;		//用户及其职位均添加成功
			 };
			 return 1;			//用户添加成功，职位添加失败
		 }
		 return 0;				//添加失败
	}
	
	public List<User> getAllUser() {
		List<User> userList = userDao.getAllUser();
		return userList;
	}

	@Override
	public List<User> getAllUser(int currentpage, int rowsize) {
		int startPage = (currentpage-1)*rowsize;
		return userDao.getAllUser(startPage, rowsize);
	}

	@Override
	public int TotalPage(int rowsize) {
		int totalPage=0;
		int alltotal=userDao.getAllTotal();
		if((alltotal%rowsize)==0) {
			totalPage=(alltotal/rowsize);
		}else if(alltotal%rowsize!=0) {
			totalPage=(alltotal/rowsize)+1;
		}
		return totalPage;
	}
	//删除员工账号
	@Override
	public int deleteUser(int userId) {
		int count=userDao.deleteUser(userId);
		if(count!=0) {
			User_role ur=new User_role();
			ur.setUserId(userId);
			if(urd.delUserRoleById(ur)) {
				return 2;	//用户及其职位均删除成功
			}
			return 1;	//用户删除成功，职位删除失败
		}
		return 0;	//删除失败
		
	}

	@Override
	public User getUserById(User user) {
		return userDao.getUserById(user);
	}
	//获取所有头像
	@Override
	public List<UserHeadSculpture> getAllPicPathById(User user) {
		
		return userDao.getAllPicPathById(user);
	}

	@Override
	public int updateHeadPic(User user, UserHeadSculpture userHeadSculpture) {
		return userDao.updateHeadPic(user, userHeadSculpture);
	}
	//上传头像
	@Override
	public int addUserHeadPic(UserHeadSculpture userHeadSculpture) {
		return userDao.addUserHeadPic(userHeadSculpture);
	}


}
