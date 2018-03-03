package cn.dtw.service;

import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;

public interface ClientContactService {
		//添加联系人返回该联系人id
		int addClientContact(Clientcontact clientcontact);
		//添加联系人id和对应公司id
		int addClientidAndClientContactId(int clientId,int contactId);
		//修改联系人
		int updateClientContact(Clientcontact clientcontact);
		//删除联系人
		int deleClientContact(Client_clientcontact client_clientcontact);
		//将绑定公司的联系人添加到对应公司
		public boolean addCustomerContact(Client client,Customer customer);
}
