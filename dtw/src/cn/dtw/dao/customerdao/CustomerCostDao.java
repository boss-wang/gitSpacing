package cn.dtw.dao.customerdao;

import java.util.List;

import cn.dtw.entity.Customer;
import cn.dtw.entity.Order_cost;

public interface CustomerCostDao {
	//通过客户id查询其应付信息，并加入订单信息
	public List<Order_cost> getCustomerCostByClientId(Customer customer);
	//修改付款状态
	public boolean updateCostStatus(int costId,int costStatus);
}
