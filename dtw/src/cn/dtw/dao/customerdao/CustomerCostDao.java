package cn.dtw.dao.customerdao;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Order_cost;

public interface CustomerCostDao {
	//通过客户id查询其应付信息，并加入订单信息
	public List<Order_cost> getCustomerCostByClientId(Client client);
}
