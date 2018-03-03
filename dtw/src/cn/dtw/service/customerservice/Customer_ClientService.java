package cn.dtw.service.customerservice;

import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;

public interface Customer_ClientService {
	//添加一个用户绑定的公司
	public boolean addCustomer_client(Customer customer,Client client);
}
