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
	private ClienttempDao clienttempDao = new ClienttempDaoImpl();
	//申请绑定公司
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
		customerDao.updateCustomerStatus(customer, 1);
		clientTemp.addClienttemp_customer(clienttemp_customer);
		return 1;
	}
	//修改临时公司存在状态
	@Override
	public boolean updateExists(Clienttemp_customer clienttemp_customer, int existsStatus) {
		return clientTemp.updateExists(clienttemp_customer, existsStatus);
	}
	//删除临时公司
	@Override
	public boolean delClienttempByCustomer(Customer customer) {
		Clienttemp clienttemp = clienttempDao.getClienttempByCustomer(customer);
		if(clienttempDao.delClienttempByCustomer(customer)) {
			if(clienttempDao.delClienttemp(clienttemp)) {
				return true;
			}
		};
		return false;
	}
	//通过客户id查询其对应临时公司信息
	@Override
	public Clienttemp getClienttempByCustomer(Customer customer) {
		return clienttempDao.getClienttempByCustomer(customer);
	}
	//解绑公司
	@Override
	public int unbindingClientByCustomerId(Customer customer) {
		if( clienttempDao.delClienttempByCustomer(customer)) {
			customerDao.updateCustomerStatus(customer, 2);
			return 1;
		}else{
			return 0;
		}
	}
	

}
