package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Leavemessage;

public interface LeaveMessageDao {
	//增加留言
	public int addMessage(Leavemessage lm);
	//显示留言信息
	public List<Leavemessage> showMessage(int startsize,int rowsize);
	//留言总数
	int getAllTotal();
}
