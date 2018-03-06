package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Order;

public interface ClientDao {
	//根据客户公司id获取联系人信息
	List<Clientcontact> getClientcontact(Client client);
	
	//根据客户公司id获取公司信息
	Client getClienttext(Client client);
			
	//根据客户公司id获取公司信息(订单)
	Client getClient(Order order);
	
	//根据公司id查询除此之外的公司信息,决定是否插入
	int getResultById(Client client);
	
	//先查询是否有重名，再添加客户
	int addClient(Client client);
	
	//获取所有客户公司信息
	List<Client> getAllClient();
	
	//分页数据
	public List<Client> getAllClient(int startPage,int rowsize);
	//搜索客户
	public List<Client> searchClient(String searchContent,int startPage,int rowsize);
	//客户总数
	public int getAllTotalClient();
	//搜索总数
	public int getSearchTotalClient(String serchContent);
	//模糊查询客户公司名
	public List<Client> getClientByName(String clientName);
	//删除客户
	int deleClientById(Client client);
	//根据公司名查询客户信息
	public Client getClientByName(Client client);
	
}
