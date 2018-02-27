package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Order;

public interface CustomerOrderService {
	//通过公司id查询订单信息
	public List<Order> getOrderList(Client client,int curPage,int pageSize);
}
