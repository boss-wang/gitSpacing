package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public interface CustomerService {
	//注册
		int addCustomer(Customer customer);
	//登录(0:用户不存在，1：成功，2：密码错误)
		int loginCustomer(Customer customer);
	//获得登录成功的客户对象
		Customer getCustomer(Customer customer);
	//根据客户公司id获取公司的所有联系人
		List<Clientcontact> getAllContactIdByClientId(Customer customer);
	//查询客户信息及审核状态
		public List<Customer> getCustomerList(int curPage,int pageSize);
	//查询客户总条数
		public int getCustomerCount();
	//根据下单人id查询客户公司id
		Customer_client getClientBycust(Customer customer);
	//根据客户id查出客户所有信息
		public Customer getCustomerByid(int customerId);
	//修改客户账号的状态
		public boolean updateCustomerStatus(Customer customer,int statusId);
}
