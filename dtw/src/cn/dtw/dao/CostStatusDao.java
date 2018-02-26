package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.CostStatus;

public interface CostStatusDao {
	//查询数据库所有付款状态
	public List<CostStatus> getAllCostStatus();
}
