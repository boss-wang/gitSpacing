package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;

public class OrderStatusDaoImpl extends BaseDao implements OrderStatusDao {
	
	//查询状态列表
	@Override
	public List<OrderStatus> getAllStatus() {
		String sql = "select * from orderStatus";
		return super.executeQuery(new BeanListHandler<OrderStatus>(OrderStatus.class), sql);
	}
	//根据id查询订单状态
	@Override
	public OrderStatus getOrderStatusById(Order order) {
		String sql = "select * from orderStatus where statusId=?";
		return super.executeOneRow(new BeanHandler<OrderStatus>(OrderStatus.class), sql, order.getStatusId());
	}

}
