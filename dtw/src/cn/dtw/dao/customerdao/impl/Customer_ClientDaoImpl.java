package cn.dtw.dao.customerdao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.Customer_ClientDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;

public class Customer_ClientDaoImpl extends BaseDao implements Customer_ClientDao {

	@Override
	public boolean addCustomer_client(Customer customer, Client client) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO customer_client(customerId,clientId) VALUES(?,?)";
		return super.executeUpdate(sql, customer.getId(),client.getClientId())>0?true:false;
	}

}
