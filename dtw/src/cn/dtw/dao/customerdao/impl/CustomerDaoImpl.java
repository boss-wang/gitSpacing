package cn.dtw.dao.customerdao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.entity.Customer;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {
	
	//注册
	@Override
	public int addCustomer(Customer customer) {
		String sql="INSERT INTO customer(loginName,loginPwd,tel,email,statusId) VALUES(?,?,?,?,?)";
		return super.executeUpdate(sql,customer.getLoginName(),customer.getLoginPwd(),customer.getTel(),customer.getEmail(),customer.getStatusId());
		
	}
	//查询
	@Override
	public Customer getCustomerByemail(Customer customer) {
		String sql="select * from customer where email=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql, customer.getEmail());
	}

	@Override
	public Customer getCustomerByloginName(Customer customer) {
		String sql="select * from customer where loginName=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql, customer.getLoginName());
	}

	@Override
	public Customer getCustomerBytel(Customer customer) {
		String sql="select * from customer where tel=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql,  customer.getTel());
	}

}
