package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.LeaveMessageDao;
import cn.dtw.entity.Leavemessage;

public class LeaveMessageDaoLmpl extends BaseDao implements LeaveMessageDao {

	@Override
	public int addMessage(Leavemessage lm) {
		String sql = "insert into leavemessage(name,phoneNum,message) values(?,?,?)";
		int id = super.executeUpdate(sql, lm.getName(),lm.getPhoneNum(),lm.getMessage());
		return id;
	}

}
