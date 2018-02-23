package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;

public interface OrderStatusDao {
	//查询订单状态列表
	public List<OrderStatus> getAllStatus();
	//根据id查询订单状态
	public OrderStatus getOrderStatusById(Order order);
}
