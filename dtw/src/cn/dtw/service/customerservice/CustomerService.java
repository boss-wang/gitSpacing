package cn.dtw.service.customerservice;

import cn.dtw.entity.Customer;

public interface CustomerService {
	//注册
		int addCustomer(Customer customer);
	//登录(0:用户不存在，1：成功，2：密码错误)
		int loginCustomer(Customer customer);
	//获得登录成功的客户对象
		Customer getCustomer(Customer customer);
}
