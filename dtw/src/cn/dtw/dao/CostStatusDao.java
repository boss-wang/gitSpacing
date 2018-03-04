package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Order_cost;

public interface CostStatusDao {
	//查询数据库所有付款状态
	public List<CostStatus> getAllCostStatus();
	//根据order_cost id查询
	CostStatus getCostStatusById(Order_cost order_cost);
}
