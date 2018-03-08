package cn.dtw.service.impl;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.service.ClientContactService;

public class ClientContactServiceImpl implements ClientContactService {
	private ClientContactDao clientContact = new ClientContactDaoImpl();
	//添加联系人并返回id
	@Override
	public int addClientContact(Clientcontact clientcontact) {
		return clientContact.addClientContact(clientcontact);
	}
	//添加联系人id和对应公司id
	@Override
	public int addClientidAndClientContactId(int clientId, int contactId) {
		return clientContact.addClientidAndClientContactId(clientId, contactId);
	}

	@Override
	public int updateClientContact(Clientcontact clientcontact) {
		return clientContact.updateClientContact(clientcontact);
		
	}

	@Override
	public int deleClientContact(Client_clientcontact client_clientcontact) {
		int m= clientContact.deleClientContact(client_clientcontact);
//		int n=clientContact.deleClientIdAndClientContactId(client_clientcontact);
		if(m>0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	//将绑定公司的客户添加到对应公司
	@Override
	public boolean addCustomerContact(Client client, Customer customer) {
		Clientcontact clientcontact = new Clientcontact();
		clientcontact.setClientContactEmail(customer.getEmail());
		clientcontact.setClientContactTel(customer.getTel());
		clientcontact.setClientContactName(customer.getRealName());
		int contactId = this.addClientContact(clientcontact);
		return this.addClientidAndClientContactId(client.getClientId(), contactId)>0?true:false;
	}

}
