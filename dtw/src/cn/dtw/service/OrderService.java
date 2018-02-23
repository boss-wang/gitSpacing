package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Terms;

public interface OrderService {
	//查询订单状态列表
	public List<OrderStatus> getAllStatus();
	//查询报关单状态列表
	public List<CustomsStatus> getAllCustomsStatus();
	//查询贸易方式列表
	public List<Terms> getAllTerms();
	//添加订单
	public boolean addOrder(Order order);
}
