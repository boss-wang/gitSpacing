package cn.dtw.dao.customerdao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.entity.Customer;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {

	@Override
	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO customer(loginName,loginPwd,tel,email) VALUES(?,?,?,?);";
		return super.executeUpdate(sql);
		
	}

}
