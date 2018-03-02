package cn.dtw.service.customerservice.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.dao.impl.OrderDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Order;
import cn.dtw.entity.User;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.impl.OrderServiceImpl;

public class CustomerOrderServiceImpl implements CustomerOrderService {
	private OrderDao orderDao = new OrderDaoImpl();
	private OrderService orderService = new OrderServiceImpl();
	private ClientContactDao clientContactDao = new ClientContactDaoImpl();
	//通过公司id查询订单信息
	@Override
	public List<Order> getOrderListByClientId(Client client, int curPage, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
	//通过订单id查询订单信息
	@Override
	public Order getOrderById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	//通过业务编号查询订单信息
	@Override
	public Order getOrderByOrderNo(String orderNo) {
		// TODO Auto-generated method stub
		return null;
	}
	//通过主单号查询订单信息
	@Override
	public List<Order> getOrderListByMawbNo(String mawbNo) {
		// TODO Auto-generated method stub
		return null;
	}
	//添加订单(客户下单)
	@Override
	public boolean addCustomerOrder(Order order) {
		Date date = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String now = formater.format(date);
		String orderNo = "YAP"+now.substring(2, 4)+now.substring(5,7)+"C"+(int)(Math.random()*500);
		order.setOrderNo(orderNo);
		while(orderService.getOrderByOrderNo(order)!=null) {
			orderNo = "YAP"+now.substring(2, 4)+now.substring(5,7)+"C"+(int)(Math.random()*500);
			order.setOrderNo(orderNo);
		}
		return  orderDao.addOrder(order);
	}
	//查询所有客户自助下单的订单列表（userId=0）
	@Override
	public List<Order> getOrderList(User user, int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		List<Order> list = orderDao.getOrderList(user, startRow, pageSize);
		List<Order> orderList = new ArrayList<Order>();
		for(Order order:list) {
			Clientcontact cc = clientContactDao.getClientContactById(order.getOrderClientContactId());
			order.setClientcontact(cc);
			orderList.add(order);
		}
		return orderList;
	}
	//查询订单
	@Override
	public int getOrderCount(User user) {
		return orderDao.getOrderCount(user);
	}

}
