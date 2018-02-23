package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;

public interface CustomsStatusDao {
	//查询报关单状态列表
	public List<CustomsStatus> getAllCustomsStatus();
	//根据id查询报关状态信息
	public CustomsStatus getCustomsStatusById(Order order);
}
