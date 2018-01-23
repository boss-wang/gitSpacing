package cn.dtw.dao;

import cn.dtw.entity.Operation;

public interface OperationDao {
	//通过id获得操作信息
	public Operation getOperationById(Operation operation);
}
