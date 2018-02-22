package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.dao.impl.CustomsStatusDaoImpl;
import cn.dtw.dao.impl.OrderStatusDaoImpl;
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.OrderStatus;
import cn.dtw.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderStatusDao orderStatusDao = new OrderStatusDaoImpl();
	private CustomsStatusDao customsStatusDao = new CustomsStatusDaoImpl();
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

}
