package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Operation;
import cn.dtw.entity.Power;

public interface Power_operationDao {
	//根据权限id获取对应的操作id
	public List<Operation> getOperationIdByPowerId(Power power);
}
