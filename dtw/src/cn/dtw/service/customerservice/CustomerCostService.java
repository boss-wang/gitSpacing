package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Order_cost;

public interface CustomerCostService {
	//通过客户id查询其应付信息
	public List<Order_cost> getCustomerCostByClientId(Client client);
}
