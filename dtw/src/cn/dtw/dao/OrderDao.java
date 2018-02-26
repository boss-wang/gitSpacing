package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.User;

public interface OrderDao {
	//添加订单
	public boolean addOrder(Order order);
	//修改订单
	public boolean updateOrder(Order order);
	//查询订单条数
	public int getOrderCount(User user);
	//查询订单列表
	public List<Order> getOrderList(User user,int startRow,int pageSize);
	//通过id查询订单信息
	public Order getOrderById(int id);
	//通过业务编号查询订单信息
	public Order getOrderByOrderNo(Order order);
}
