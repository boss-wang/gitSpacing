package cn.dtw.dao.customerdao.impl;

import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.Customer_ClientDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public class Customer_ClientDaoImpl extends BaseDao implements Customer_ClientDao {
	//添加一个用户绑定的公司
	@Override
	public boolean addCustomer_client(Customer customer, Client client) {
		String sql="INSERT INTO customer_client(customerId,clientId) VALUES(?,?)";
		return super.executeUpdate(sql, customer.getId(),client.getClientId())>0?true:false;
	}
	//查询绑定的公司id
	@Override
	public Customer_client getClientIdByCustomer(Customer customer) {
		String sql="select * from clienttemp_customer where customerId=?";
		return super.executeOneRow(new BeanHandler<Customer_client>(Customer_client.class), sql, customer.getId());
	}
	//删除绑定的公司
	@Override
	public boolean delCustomer_client(Customer customer) {
		String sql = "delete from customer_client where customerId=?";
		return super.executeUpdate(sql, customer.getId())>0?true:false;
	}

}
