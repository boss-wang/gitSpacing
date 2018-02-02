package cn.dtw.service;

import cn.dtw.entity.Clientcontact;

public interface ClientContactService {
	//添加联系人返回该联系人id
		int addClientContact(Clientcontact clientcontact);
		//添加联系人id和对应公司id
		int addClientidAndClientContactId(int clientId,int contactId);
}
