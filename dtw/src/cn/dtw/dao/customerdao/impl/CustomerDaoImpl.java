package cn.dtw.dao.customerdao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {
	
	//注册
	@Override
	public int addCustomer(Customer customer) {
		String sql="INSERT INTO customer(loginName,loginPwd,tel,email,statusId) VALUES(?,?,?,?,?)";
		return super.executeUpdate(sql,customer.getLoginName(),customer.getLoginPwd(),customer.getTel(),customer.getEmail(),customer.getStatusId());
		
	}
	//登录查询
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
	//根据下单人id查询客户公司id
	@Override
	public Customer_client getClientBycust(Customer customer) {
		String sql="select * from customer_client where customerId=?";
		return super.executeOneRow(new BeanHandler<Customer_client>(Customer_client.class), sql, customer.getId());
	}
	//根据客户公司id获取公司的所有联系人
	@Override
	public List<Clientcontact> getAllContactIdByClientId(Customer customer) {
		String sql = "select clientContactEmail,clientcontact.clientContactId,clientContactName,clientContactQQ,clientContactTel "
				+ "from clientcontact,client_clientcontact "
				+ "where client_clientcontact.clientContactId=clientcontact.clientContactId "
				+ "and clientId=(select clientId from customer_client where customerId=?)";
		return super.executeQuery(new BeanListHandler<Clientcontact>(Clientcontact.class), sql, customer.getId());
	}
	@Override
	public int updateStatusByid(Customer customer) {
		String sql ="update customer set statusId=? where id=?";
		return super.executeUpdate(sql, customer.getStatusId(),customer.getId());
	}
	
	
}
