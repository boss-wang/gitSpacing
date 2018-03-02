package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

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

	@Override
	public List<Leavemessage> showMessage(int startsize,int rowsize) {
		String sql="select * from leavemessage limit ?,?";
		
		return super.executeQuery(new BeanListHandler<Leavemessage>(Leavemessage.class), sql, startsize,rowsize);
	}
	//获得总量
	@Override
	public int getAllTotal() {
		String sql="select count(1) as count from leavemessage";
		Object obj=  super.executeOneColumn(new ScalarHandler("count"), sql);
		Long m = (long)obj;
		return 	m.intValue();
	}

}
