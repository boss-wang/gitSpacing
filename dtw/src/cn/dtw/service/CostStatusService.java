package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.CostStatus;

public interface CostStatusService {
	//查询数据库所有付款状态
	public List<CostStatus> getAllCostStatus();
}
