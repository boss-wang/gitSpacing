package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.OrderStatus;

public interface OrderStatusDao {
	//查询订单状态列表
	public List<OrderStatus> getAllStatus();
}
