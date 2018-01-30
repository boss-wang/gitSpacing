package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Client;

public interface ClientService {
	//获取所有客户公司信息
		List<Client> getAllClient();
	//获得分页数据
		public List<Client> getAllClient(int currentPage,int rowsize);
	//总页数	
		public int getAllTotalPage(int rowsize);

}
