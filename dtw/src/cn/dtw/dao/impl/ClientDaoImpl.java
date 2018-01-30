package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;

public class ClientDaoImpl extends BaseDao implements ClientDao {

	@Override
	public List<Client> getAllClient() {
		String sql = "SELECT * FROM client  ";
		ResultSet res=	super.executeQuery(sql);
		List<Client> list = new ArrayList<Client>();
		try {
			while(res.next()) {
				Client client = new Client();
				client.setClientId(res.getInt("clientId"));
				client.setClientName(res.getString("clientName"));
				client.setClientAddress(res.getString("clientAddress"));
				List<Clientcontact> clientContactList = new ArrayList<Clientcontact>();
				clientContactList=this.getClientcontact(client);
				client.setClientContactlist(clientContactList);
				list.add(client);
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	


	@Override
	public List<Clientcontact> getClientcontact(Client client) {
		String sql = "select  clientContactName,ClientContactTel,ClientContactEmail,ClientContactQQ FROM client_clientcontact,clientcontact WHERE  client_clientcontact.clientContactId=clientcontact.clientContactId AND client_clientcontact.clientId=? ";
		ResultSet res= super.executeQuery(sql, client.getClientId());
		List<Clientcontact> list = new ArrayList<Clientcontact>();
		try {
			while(res.next()){
				Clientcontact clientcontact =  new Clientcontact();
				clientcontact.setClientContactName(res.getString("clientContactName"));
				clientcontact.setClientContactTel(res.getString("ClientContactTel"));
				if(res.getString("ClientContactEmail")!=null&&!res.getString("ClientContactEmail").equals("")) {
					clientcontact.setClientContactEmail(res.getString("ClientContactEmail"));
				}
				if(res.getString("ClientContactQQ")!=null&&!res.getString("ClientContactEmail").equals("")) {
					clientcontact.setClientContactQQ(res.getString("ClientContactQQ"));
				}
				list.add(clientcontact);
				
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



	@Override
	public List<Client> getAllClient(int startPage, int rowsize) {
		String sql ="select * from client limit ?,?";
		ResultSet res= super.executeQuery(sql, startPage,rowsize);
		List<Client> list = new ArrayList<Client>();

		try {
			while(res.next()) {
				Client client = new Client();
				client.setClientId(res.getInt("clientId"));
				client.setClientName(res.getString("clientName"));
				client.setClientAddress(res.getString("clientAddress"));
				List<Clientcontact> clientContactList = new ArrayList<Clientcontact>();
				clientContactList=this.getClientcontact(client);
				client.setClientContactlist(clientContactList);
				list.add(client);
			}
			super.closeRes();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



	@Override
	public int getAllTotalClient() {
		String sql ="select count(*) as count from client ";
		ResultSet res=	super.executeQuery(sql);
		int count=0;
		try {
			while(res.next()) {
				count=res.getInt("count");
			}
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
