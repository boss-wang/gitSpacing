package cn.dtw.service.customerservice.impl;


import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.entity.Customer;
import cn.dtw.service.customerservice.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	CustomerDao customerDao = new CustomerDaoImpl();
	//注册
	@Override
	public int addCustomer(Customer customer) {
		return customerDao.addCustomer(customer);
	}
	//登录(0:用户不存在，1：成功，2：密码错误)
	@Override
	public int loginCustomer(Customer customer) {
	Customer cust1=customerDao.getCustomerByemail(customer);
	Customer cust2=customerDao.getCustomerBytel(customer);
	Customer cust3=customerDao.getCustomerByloginName(customer);
	if(cust1!=null) {
		if(customer.getLoginPwd().equals(cust1.getLoginPwd())) {
			return 1;
		}
		return 2;
	}else if(cust2!=null) {
		if(customer.getLoginPwd().equals(cust2.getLoginPwd())) {
			return 1;
		}
		return 2;
	}else if(cust3!=null) {
		if(customer.getLoginPwd().equals(cust3.getLoginPwd())) {
			return 1;
		}
		return 2;
	}
		return 0;
	}
	@Override
	public Customer getCustomer(Customer customer) {
		Customer cust1=customerDao.getCustomerByemail(customer);
		Customer cust2=customerDao.getCustomerBytel(customer);
		Customer cust3=customerDao.getCustomerByloginName(customer);
		if(cust1!=null) {
			
			return cust1;
		}else if(cust2!=null) {
			return cust2;
		}else if(cust3!=null) {
			return cust3;
		}
		return null;
	}

}
