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
}
