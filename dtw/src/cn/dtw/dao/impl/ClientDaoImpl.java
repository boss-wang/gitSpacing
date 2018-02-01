package cn.dtw.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Client_clientcontact;
import cn.dtw.entity.Clientcontact;

public class ClientDaoImpl extends BaseDao implements ClientDao {

	//查询所有客户
	@Override
	public List<Client> getAllClient() {
		String sql = "SELECT * FROM client";
		List<Client> list = super.executeQuery(new BeanListHandler<Client>(Client.class), sql);
		List<Client> clientList = new ArrayList<Client>();
		for(Client client:list) {
			//添加客户联系人信息
			List<Clientcontact> clientContactList = new ArrayList<Clientcontact>();
			clientContactList=this.getClientcontact(client);
			client.setClientContactlist(clientContactList);
			clientList.add(client);
		}
		return clientList;
	}
	

	//根据客户id查询客户的联系人信息
	@Override
	public List<Clientcontact> getClientcontact(Client client) {
		String sql = "select  clientContactName,ClientContactTel,ClientContactEmail,ClientContactQQ FROM client_clientcontact,clientcontact WHERE  client_clientcontact.clientContactId=clientcontact.clientContactId AND client_clientcontact.clientId=? ";
		return super.executeQuery(new BeanListHandler<Clientcontact>(Clientcontact.class), sql, client.getClientId());
	}


	//分页查询客户信息
	@Override
	public List<Client> getAllClient(int startPage, int rowsize) {
		String sql ="select * from client limit ?,?";
		List<Client> list = super.executeQuery(new BeanListHandler<Client>(Client.class), sql,startPage,rowsize);
		List<Client> clientList = new ArrayList<Client>();
		for(Client client:list) {
			//添加客户联系人信息
			List<Clientcontact> clientContactList = new ArrayList<Clientcontact>();
			clientContactList=this.getClientcontact(client);
			client.setClientContactlist(clientContactList);
			clientList.add(client);
		}
		return clientList;
	}


	//查询所有客户记录条数
	@Override
	public int getAllTotalClient() {
		String sql ="select count(1) as count from client ";
		Long total = (Long)super.executeOneColumn(new ScalarHandler("count"), sql);
		return total.intValue();
	}

}
