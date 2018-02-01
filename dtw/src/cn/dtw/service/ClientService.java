package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Client;

public interface ClientService {
	//获取所有客户公司信息
		List<Client> getAllClient();
	//根据客户公司id获取公司信息
		Client getClienttext(Client client);
	//根据公司id查询除此之外的公司信息,决定是否插入
		int getResultById(Client client);
	//获得分页数据
		public List<Client> getAllClient(int currentPage,int rowsize);
	//总页数	
		public int getAllTotalPage(int rowsize);

}
