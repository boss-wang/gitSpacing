package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.dao.Order_costDao;
import cn.dtw.dao.Order_payDao;
import cn.dtw.dao.TermsDao;
import cn.dtw.dao.impl.CustomsStatusDaoImpl;
import cn.dtw.dao.impl.OrderDaoImpl;
import cn.dtw.dao.impl.OrderStatusDaoImpl;
import cn.dtw.dao.impl.Order_costDaoImpl;
import cn.dtw.dao.impl.Order_payDaoImpl;
import cn.dtw.dao.impl.TermsDaoImpl;
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Order_cost;
import cn.dtw.entity.Order_pay;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;
import cn.dtw.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderStatusDao orderStatusDao = new OrderStatusDaoImpl();
	private CustomsStatusDao customsStatusDao = new CustomsStatusDaoImpl();
	private OrderDao orderDao = new OrderDaoImpl();
	private TermsDao termsDao = new TermsDaoImpl();
	private Order_costDao orderCostDao = new Order_costDaoImpl();
	private Order_payDao orderPayDao = new Order_payDaoImpl();
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
	//通过id查询订单信息
	@Override
	public Order getOrderById(int id) {
		return orderDao.getOrderById(id);
	}
	//修改订单
	@Override
	public boolean updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}
	//通过业务编号查询订单信息
	@Override
	public Order getOrderByOrderNo(Order order) {
		return orderDao.getOrderByOrderNo(order);
	}
	//添加应收
	@Override
	public boolean addOrderCost(Order_cost orderCost) {
		return orderCostDao.addOrderCost(orderCost);
	}
	//修改应收
	@Override
	public boolean updateCost(Order_cost orderCost) {
		return orderCostDao.updateCost(orderCost);
	}
	//删除应收
	@Override
	public boolean delCost(Order_cost orderCost) {
		return orderCostDao.delCost(orderCost);
	}
	//添加应付
	@Override
	public boolean addOrderPay(Order_pay orderPay) {
		return orderPayDao.addOrderPay(orderPay);
	}
	//删除应付
	@Override
	public boolean delPay(Order_pay orderPay) {
		return orderPayDao.delPay(orderPay);
	}
	//修改订单状态
	@Override
	public boolean updateOrderStatus(Order order, int statusId) {
		return orderDao.updateOrderStatus(order, statusId);
	}
	//修改应付
	@Override
	public boolean updatePay(Order_pay orderPay) {
		return orderPayDao.updatePay(orderPay);
	}
	//删除订单
	@Override
	public boolean delOrder(Order order) {
		orderPayDao.delPayByOrder(order);
		orderCostDao.delCostByOrder(order);
		return orderDao.delOrder(order);
	}
	//搜索订单的条数
	@Override
	public int searchOrderCount(String searchContent, User user) {
		return orderDao.searchOrderCount(searchContent, user);
	}
	//搜索订单
	@Override
	public List<Order> searchOrderList(String searchContent, User user, int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		return orderDao.searchOrderList(searchContent,user, startRow, pageSize);
	}

}
