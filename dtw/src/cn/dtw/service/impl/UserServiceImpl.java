package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.UserDao;
import cn.dtw.dao.User_roleDao;
import cn.dtw.dao.impl.UserDaoImpl;
import cn.dtw.dao.impl.User_roleDaoImpl;
import cn.dtw.entity.Role;
import cn.dtw.entity.User;
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
		// TODO Auto-generated method stub
		 int userId=userDao.addUser(user,role);
		 User_role ur=new User_role();
		 ur.setUserId(userId);
		 ur.setRoleId(role.getRoleId());
		 urd.addUserRoleById(ur);
		 return 0;
	}
	public List<User> getAllUser() {
		List<User> userList = userDao.getAllUser();
		return userList;
	}

}
