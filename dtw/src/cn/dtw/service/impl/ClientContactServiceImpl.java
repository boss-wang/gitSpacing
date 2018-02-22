package cn.dtw.service.impl;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;
import cn.dtw.service.ClientContactService;

public class ClientContactServiceImpl implements ClientContactService {
	private ClientContactDao clientContact = new ClientContactDaoImpl();
	@Override
	public int addClientContact(Clientcontact clientcontact) {
		return clientContact.addClientContact(clientcontact);
	}

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
		int n=clientContact.deleClientIdAndClientContactId(client_clientcontact);
		if(m==1&&n==1) {
			return 1;
		}else {
			return 0;
		}
		
	}

}
