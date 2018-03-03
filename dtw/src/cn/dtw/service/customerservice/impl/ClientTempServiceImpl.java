package cn.dtw.service.customerservice.impl;

import cn.dtw.dao.ClientDao;
import cn.dtw.dao.customerdao.ClienttempDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.impl.ClienttempDaoImpl;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.dao.impl.ClientDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.Customer;
import cn.dtw.service.customerservice.ClienttempService;

public class ClientTempServiceImpl implements ClienttempService {
	private  ClienttempDao clientTemp = new ClienttempDaoImpl();
	private CustomerDao customerDao = new CustomerDaoImpl();
	private ClientDao clientDao = new ClientDaoImpl();
	@Override
	public int addClienttemp_customer(Clienttemp_customer clienttemp_customer, Clienttemp clienttemp) {
		int clientId = clientTemp.addClienttemp(clienttemp);
		clienttemp_customer.setClientId(clientId);
		Client client1 = new Client();
		client1.setClientName(clienttemp.getClientName());
		Client client = clientDao.getClientByName(client1);
		if(client==null) {
			clienttemp_customer.setClientExists(0);
		}else {
			clienttemp_customer.setClientExists(1);
		}
		Customer customer = new Customer();
		customer.setId(clienttemp_customer.getCustomerId());
		customer.setStatusId(1);
		customerDao.updateStatusByid(customer);
		clientTemp.addClienttemp_customer(clienttemp_customer);
		return 1;
	}
	//修改临时公司存在状态
	@Override
	public boolean updateExists(Clienttemp_customer clienttemp_customer, int existsStatus) {
		return clientTemp.updateExists(clienttemp_customer, existsStatus);
	}
	

}
