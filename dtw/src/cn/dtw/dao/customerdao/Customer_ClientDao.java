package cn.dtw.dao.customerdao;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public interface Customer_ClientDao {
	//添加一个用户绑定的公司
	public boolean addCustomer_client(Customer customer,Client client);
	//查询绑定的公司id
	Customer_client getClientIdByCustomer(Customer customer);
	//删除一个用户绑定的公司
	public boolean delCustomer_client(Customer customer);
	//根据客户公司id查询对应客户
	List<Customer_client> getCustomerIdByClient(Client client);
}
