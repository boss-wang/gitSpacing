package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.CustomsStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.OrderStatus;
import cn.dtw.entity.Order_cost;
import cn.dtw.entity.Order_pay;
import cn.dtw.entity.Terms;
import cn.dtw.entity.User;

public interface OrderService {
	//查询订单状态列表
	public List<OrderStatus> getAllStatus();
	//查询报关单状态列表
	public List<CustomsStatus> getAllCustomsStatus();
	//查询贸易方式列表
	public List<Terms> getAllTerms();
	//添加订单
	public boolean addOrder(Order order);
	//删除订单
	public boolean delOrder(Order order);
	//查询订单列表
	public List<Order> getOrderList(User user,int curPage,int pageSize);
	//搜索订单列表
	public List<Order> searchOrderList(String searchContent,User user,int curPage,int pageSize);
	//查询订单数量
	public int getOrderCount(User user);
	//查询搜索的订单数量
	public int searchOrderCount(String searchContent,User user);
	//通过id查询订单信息
	public Order getOrderById(int id);
	//修改订单
	public boolean updateOrder(Order order);
	//通过业务编号查询订单信息
	public Order getOrderByOrderNo(Order order);
	//添加应收
	public boolean addOrderCost(Order_cost orderCost);
	//修改应收
	public boolean updateCost(Order_cost orderCost);
	//删除应收
	public boolean delCost(Order_cost orderCost);
	//添加应付
	public boolean addOrderPay(Order_pay orderPay);
	//删除应付
	public boolean delPay(Order_pay orderPay);
	//修改应付
	public boolean updatePay(Order_pay orderPay);
	//修改订单状态
	public boolean updateOrderStatus(Order order,int statusId);
}
