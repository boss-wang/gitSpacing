package cn.dtw.service.impl;

import java.util.List;

import cn.dtw.dao.ClientDao;
import cn.dtw.dao.impl.ClientDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.service.ClientService;

public class ClientServiceImpl implements ClientService {
	private ClientDao clientDao = new ClientDaoImpl();
	@Override
	public List<Client> getAllClient() {
		return clientDao.getAllClient();
	}

}
