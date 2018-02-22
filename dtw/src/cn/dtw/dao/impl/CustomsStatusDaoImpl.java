package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.entity.CustomsStatus;

public class CustomsStatusDaoImpl extends BaseDao implements CustomsStatusDao {
	//查询报关单状态列表
	@Override
	public List<CustomsStatus> getAllCustomsStatus() {
		String sql = "select * from customsStatus";
		return super.executeQuery(new BeanListHandler<CustomsStatus>(CustomsStatus.class), sql);
	}

}
