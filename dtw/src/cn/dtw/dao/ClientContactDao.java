package cn.dtw.dao;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;

public interface ClientContactDao {
	//添加联系人返回该联系人id
	int addClientContact(Clientcontact clientcontact);
	//添加联系人id和对应公司id
	int addClientidAndClientContactId(int clientId,int contactId);
}
