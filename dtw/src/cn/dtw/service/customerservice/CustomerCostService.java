package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Order_cost;

public interface CustomerCostService {
	//通过客户id查询其应付信息
	public List<Order_cost> getCustomerCostByClientId(Client client);
	//通过下单人id查询订单信息及付款信息
		List<Order_cost> getPayOrderByCustomerId(Customer customer,int curPage,int rowSize );
	//根据下单人id查询订单条数
		int getPayOrderCountByCustomerId(Customer customer);
}
