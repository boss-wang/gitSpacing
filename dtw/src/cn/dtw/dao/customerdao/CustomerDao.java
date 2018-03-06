package cn.dtw.dao.customerdao;


import java.util.List;

import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public interface CustomerDao {
	//添加用户
	int addCustomer(Customer customer);
	//根据邮箱查询
	Customer getCustomerByemail(Customer customer);
	//根据用户名查询
	Customer getCustomerByloginName(Customer customer);
	//根据手机号查询
	Customer getCustomerBytel(Customer customer);
	//根据下单人id查询客户公司id
	Customer_client getClientBycust(Customer customer);
	//根据客户公司id获取公司的所有联系人
	List<Clientcontact> getAllContactIdByClientId(Customer customer);
	//查询客户信息及审核状态
	public List<Customer> getCustomerList(int startRow,int pageSize);
	//查询客户总条数
	public int getCustomerCount();
	//根据客户id查出客户所有信息
	public Customer getCustomerByid(int customerId);
	//修改客户账号的状态
	public boolean updateCustomerStatus(Customer customer,int statusId);
	//根据下单人id更新真实姓名
	int updateRealNameByCustomer(Customer customer);
	//根据下单人id更新手机号
	int updateTeleByCustomerId(Customer customer);
}
