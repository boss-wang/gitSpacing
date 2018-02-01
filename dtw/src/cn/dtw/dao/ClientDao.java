package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;

public interface ClientDao {
	//根据客户公司id获取联系人信息
	List<Clientcontact> getClientcontact(Client client);
	
	//根据客户公司id获取公司信息
	Client getClienttext(Client client);
	
	//根据公司id查询除此之外的公司信息,决定是否插入
	int getResultById(Client client);
	
	
	//获取所有客户公司信息
	List<Client> getAllClient();
	
	//分页数据
	public List<Client> getAllClient(int startPage,int rowsize);
	
	//客户总数
	public int getAllTotalClient();
}
