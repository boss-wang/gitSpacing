package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.Order_costDao;
import cn.dtw.entity.Order_cost;

public class Order_costDaoImpl extends BaseDao implements Order_costDao {

	//添加应收
	@Override
	public boolean addOrderCost(Order_cost orderCost) {
		String sql = "insert into order_cost(orderId,clientId,cost,invoiceNo,costStatus) values(?,?,?,?,?)";
		return super.executeUpdate(sql, orderCost.getOrderId(),orderCost.getClientId(),orderCost.getCost(),orderCost.getInvoiceNo(),orderCost.getCostStatus())>0?true:false;
	}

}
