package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.Order_cost;

public interface Order_costDao {
	//添加应收
	public boolean addOrderCost(Order_cost orderCost);
	//根据订单id查询应收
	public List<Order_cost> getCostByOrderId(Order order);
	//修改应收
	public boolean updateCost(Order_cost orderCost);
	//删除应收
	public boolean delCost(Order_cost orderCost);
}
