package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.entity.OrderStatus;

public class OrderStatusDaoImpl extends BaseDao implements OrderStatusDao {
	
	//查询状态列表
	@Override
	public List<OrderStatus> getAllStatus() {
		String sql = "select * from orderStatus";
		return super.executeQuery(new BeanListHandler<OrderStatus>(OrderStatus.class), sql);
	}

}
