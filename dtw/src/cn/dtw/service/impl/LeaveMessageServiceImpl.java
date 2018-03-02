package cn.dtw.service.impl;

import java.util.List;

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

	@Override
	public List<Leavemessage> showMessage(int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		return lmDao.showMessage((pageCode-1)*pageSize, pageSize);
	}

}
