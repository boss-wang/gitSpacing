package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Leavemessage;

public interface LeaveMessageService {
	//增加留言
	public int addMessage(Leavemessage lm);
	//显示留言信息
	public List<Leavemessage> showMessage(int pageCode,int pageSize);
	//总页数
	int getAllTotalPage(int rowsize);
	//删除留言
		int delMessageByid(Leavemessage leavemessage);
}
