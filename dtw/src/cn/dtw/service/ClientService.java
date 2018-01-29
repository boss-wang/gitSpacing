package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Client;

public interface ClientService {
	//获取所有客户公司信息
		List<Client> getAllClient();
}
