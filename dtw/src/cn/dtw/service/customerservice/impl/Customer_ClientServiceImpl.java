package cn.dtw.service.customerservice.impl;

import cn.dtw.dao.customerdao.Customer_ClientDao;
import cn.dtw.dao.customerdao.impl.Customer_ClientDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;
import cn.dtw.service.customerservice.Customer_ClientService;

public class Customer_ClientServiceImpl implements Customer_ClientService {
	Customer_ClientDao customer_ClientDao=new Customer_ClientDaoImpl();
	//添加一个用户绑定的公司
	@Override
	public boolean addCustomer_client(Customer customer, Client client) {
		// TODO Auto-generated method stub
		return customer_ClientDao.addCustomer_client(customer, client);
	}

}
