package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.CostStatusDao;
import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Order_cost;

public class CostStatusDaoImpl extends BaseDao implements CostStatusDao {

	//查询数据库所有付款状态列表
	@Override
	public List<CostStatus> getAllCostStatus() {
		String sql = "select * from coststatus";
		return super.executeQuery(new BeanListHandler<CostStatus>(CostStatus.class), sql);
	}
	//根据order_cost id查询
	@Override
	public CostStatus getCostStatusById(Order_cost order_cost) {
		String sql="select * from coststatus where id=?";
		return super.executeOneRow(new BeanHandler<CostStatus>(CostStatus.class), sql, order_cost.getCostStatus());
	}

}
