package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.CostStatusDao;
import cn.dtw.entity.CostStatus;

public class CostStatusDaoImpl extends BaseDao implements CostStatusDao {

	//查询数据库所有付款状态列表
	@Override
	public List<CostStatus> getAllCostStatus() {
		String sql = "select * from coststatus";
		return super.executeQuery(new BeanListHandler<CostStatus>(CostStatus.class), sql);
	}

}
