package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;

public interface ClientContactDao {
	//添加联系人返回该联系人id
	int addClientContact(Clientcontact clientcontact);
	//添加联系人id和对应公司id
	int addClientidAndClientContactId(int clientId,int contactId);
	//修改联系人
	int updateClientContact(Clientcontact clientcontact);
	//删除联系人
	int deleClientContact(Client_clientcontact client_clientcontact);
	//删除联系人id和对应公司id
	int deleClientIdAndClientContactId(Client_clientcontact client_clientcontact);
	//根据客户id获取所有联系人id
	List<Client_clientcontact> getAllContactIdByClientId(Client client);
	//通过id获取联系人信息
	public Clientcontact getClientContactById(int id);
	//通过下单人手机号更新联系人手机号
	int updateClientcontactByCustomer(Customer newCustomer,Customer oldCustomer);
}
