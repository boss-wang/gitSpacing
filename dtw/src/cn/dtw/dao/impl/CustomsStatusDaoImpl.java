package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;

public class CustomsStatusDaoImpl extends BaseDao implements CustomsStatusDao {
	//查询报关单状态列表
	@Override
	public List<CustomsStatus> getAllCustomsStatus() {
		String sql = "select * from customsStatus";
		return super.executeQuery(new BeanListHandler<CustomsStatus>(CustomsStatus.class), sql);
	}
	//根据id查询报关状态信息
	@Override
	public CustomsStatus getCustomsStatusById(Order order) {
		String sql = "select * from customsStatus where id=?";
		return super.executeOneRow(new BeanHandler<CustomsStatus>(CustomsStatus.class), sql, order.getCustomsStatus());
	}

}
