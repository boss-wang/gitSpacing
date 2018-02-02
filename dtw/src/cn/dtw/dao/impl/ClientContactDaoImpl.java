package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientContactDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;

public class ClientContactDaoImpl extends BaseDao implements ClientContactDao {

	@Override
	public int addClientContact(Clientcontact clientcontact) {
		String sql = "insert into clientcontact (clientContactName,ClientContactTel,ClientContactEmail,ClientContactQQ)values(?,?,?,?)";
		return super.executeUpdateAndReturnId(sql, clientcontact.getClientContactName(),clientcontact.getClientContactTel(),clientcontact.getClientContactEmail(),clientcontact.getClientContactQQ());
	}

	@Override
	public int addClientidAndClientContactId(int clientId, int contactId) {
		String sql = "insert into client_clientcontact (clientId,clientContactId) values(?,?)";
		return super.executeUpdate(sql, clientId,contactId);
	}

}
