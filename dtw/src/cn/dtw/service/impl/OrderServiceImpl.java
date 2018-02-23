package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.dao.TermsDao;
import cn.dtw.dao.impl.CustomsStatusDaoImpl;
import cn.dtw.dao.impl.OrderDaoImpl;
import cn.dtw.dao.impl.OrderStatusDaoImpl;
import cn.dtw.dao.impl.TermsDaoImpl;
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
import cn.dtw.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderStatusDao orderStatusDao = new OrderStatusDaoImpl();
	private CustomsStatusDao customsStatusDao = new CustomsStatusDaoImpl();
	private OrderDao orderDao = new OrderDaoImpl();
	private TermsDao termsDao = new TermsDaoImpl();
	//查询状态列表
	@Override
	public List<OrderStatus> getAllStatus() {
		return orderStatusDao.getAllStatus();
	}
	//查询报关单状态列表
	@Override
	public List<CustomsStatus> getAllCustomsStatus() {
		return customsStatusDao.getAllCustomsStatus();
	}
	//添加订单
	@Override
	public boolean addOrder(Order order) {
		return orderDao.addOrder(order);
	}
	//查询贸易方式列表
	@Override
	public List<Terms> getAllTerms() {
		return termsDao.getAllTerms();
	}
	//查询订单列表
	@Override
	public List<Order> getOrderList(User user, int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		return orderDao.getOrderList(user, startRow, pageSize);
	}
	//查询订单数量
	@Override
	public int getOrderCount(User user) {
		return orderDao.getOrderCount(user);
	}

}
