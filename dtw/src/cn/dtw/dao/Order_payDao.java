package cn.dtw.dao;


import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.Order_pay;

public interface Order_payDao {
	//添加应付
	public boolean addOrderPay(Order_pay orderPay);
	//根据订单id查询应付
	public List<Order_pay> getPayByOrderId(Order order);
	//修改应付
	public boolean updatePay(Order_pay orderPay);
	//删除应付
	public boolean delPay(Order_pay orderPay);
	//根据订单号删除应付
	public int delPayByOrder(Order order);
}
