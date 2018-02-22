package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.OrderStatus;

public interface OrderService {
	//查询订单状态列表
	public List<OrderStatus> getAllStatus();
	//查询报关单状态列表
	public List<CustomsStatus> getAllCustomsStatus();
}
