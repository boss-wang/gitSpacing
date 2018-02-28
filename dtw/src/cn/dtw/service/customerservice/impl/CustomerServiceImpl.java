package cn.dtw.service.customerservice.impl;

import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.entity.Customer;
import cn.dtw.service.customerservice.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	CustomerDao customerDao = new CustomerDaoImpl();
	@Override
	public int addCustomer(Customer customer) {
		return customerDao.addCustomer(customer);
	}

}
