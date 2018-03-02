package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;

public interface CustomerService {
	//注册
		int addCustomer(Customer customer);
	//登录(0:用户不存在，1：成功，2：密码错误)
		int loginCustomer(Customer customer);
	//获得登录成功的客户对象
		Customer getCustomer(Customer customer);
	//根据客户公司id获取公司的所有联系人
		List<Clientcontact> getAllContactIdByClientId(Customer customer);
}
