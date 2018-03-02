package cn.dtw.service.impl;

import cn.dtw.dao.LeaveMessageDao;
import cn.dtw.dao.impl.LeaveMessageDaoLmpl;
import cn.dtw.entity.Leavemessage;
import cn.dtw.service.LeaveMessageService;

public class LeaveMessageServiceImpl implements LeaveMessageService {
	LeaveMessageDao lmDao = new LeaveMessageDaoLmpl();

	@Override
	public int addMessage(Leavemessage lm) {
		int rs = lmDao.addMessage(lm);
		return rs;
	}

}
