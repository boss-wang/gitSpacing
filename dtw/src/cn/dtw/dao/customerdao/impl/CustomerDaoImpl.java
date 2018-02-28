package cn.dtw.dao.customerdao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.entity.Customer;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {

	@Override
	public int addCustomer(Customer customer) {
		String sql="INSERT INTO customer(loginName,loginPwd,tel,email,statusId) VALUES(?,?,?,?,?)";
		return super.executeUpdate(sql,customer.getLoginName(),customer.getLoginPwd(),customer.getTel(),customer.getEmail(),customer.getStatusId());
		
	}

}
