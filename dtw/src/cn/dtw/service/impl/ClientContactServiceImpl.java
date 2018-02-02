package cn.dtw.service.impl;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
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

}
