package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.User;

public interface OrderDao {
	//添加订单
	public boolean addOrder(Order order);
	//查询订单条数
	public int getOrderCount(User user);
	//查询订单列表
	public List<Order> getOrderList(User user,int startRow,int pageSize);
}
