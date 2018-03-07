package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.User;

public interface OrderDao {
	//添加订单
	public boolean addOrder(Order order);
	//修改订单
	public boolean updateOrder(Order order);
	//查询订单条数
	public int getOrderCount(User user);
	//查询搜索的订单数量
	public int searchOrderCount(String searchContent,User user);
	//根据用户id获得所有订单
	public List<Order> getOrderList(User user);
	//查询订单列表
	public List<Order> getOrderList(User user,int startRow,int pageSize);
	//搜索订单列表
	public List<Order> searchOrderList(String searchContent,User user,int startRow,int pageSize);
	//通过id查询订单信息
	public Order getOrderById(int id);
	//通过业务编号查询订单信息
	public Order getOrderByOrderNo(Order order);
	//修改订单状态
	public boolean updateOrderStatus(Order order,int statusId);
	//删除订单
	public boolean delOrder(Order order);
}
