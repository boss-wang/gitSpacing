package cn.dtw.service.impl;

import cn.dtw.dao.UserDao;
import cn.dtw.dao.impl.UserDaoImpl;
import cn.dtw.entity.User;
import cn.dtw.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();
	
	@Override
	public User getUserByAccount(User user) {
		User userGet = userDao.getUserByAccount(user);
		return userGet;
	}

}
