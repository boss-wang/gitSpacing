package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.CostStatusDao;
import cn.dtw.dao.impl.CostStatusDaoImpl;
import cn.dtw.entity.CostStatus;
import cn.dtw.service.CostStatusService;

public class CostStatusServiceImpl implements CostStatusService {
	CostStatusDao costStatusDao = new CostStatusDaoImpl();
	//查询数据库所有付款状态
	@Override
	public List<CostStatus> getAllCostStatus() {
		return costStatusDao.getAllCostStatus();
	}

}
