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
	@Override
	public List<Client> getAllClient(int currentPage, int rowsize) {
		int startPage = (currentPage-1)*rowsize;
		
		return clientDao.getAllClient(startPage, rowsize);
	}
	@Override
	public int getAllTotalPage(int rowsize) {
		int totalPage=0;
		int alltotal=clientDao.getAllTotalClient();
		if((alltotal%rowsize)==0) {
			totalPage=(alltotal/rowsize);
		}else if(alltotal%rowsize!=0) {
			totalPage=(alltotal/rowsize)+1;
		}
		return totalPage;
	}
	@Override
	public Client getClienttext(Client client) {
		return clientDao.getClienttext(client);
	}
	@Override
	public int getResultById(Client client) {
		return clientDao.getResultById(client);
	}
	@Override
	public int addClient(Client client) {
		
		return clientDao.addClient(client);
	}

}
