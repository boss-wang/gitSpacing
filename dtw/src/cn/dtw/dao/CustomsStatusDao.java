package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.CustomsStatus;

public interface CustomsStatusDao {
	//查询报关单状态列表
	public List<CustomsStatus> getAllCustomsStatus();
}
