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
	
	//分页
	@Override
	public List<Leavemessage> showMessage(int pageCode, int pageSize) {
	
		return lmDao.showMessage((pageCode-1)*pageSize, pageSize);
	}
	//总页数
	@Override
	public int getAllTotalPage(int rowsize) {
		int totalPage= 0;
		int totalCount=lmDao.getAllTotal();
		if(totalCount%rowsize==0) {
			totalPage=totalCount/rowsize;
		}else if(totalCount%rowsize!=0) {
			totalPage=totalCount/rowsize+1;
		}
		return totalPage;
	}

}
