package cn.dtw.service.customerservice.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.customerdao.CustomerCostDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.CustomerOrderDao;
import cn.dtw.dao.customerdao.impl.CustomerCostDaoImpl;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.dao.customerdao.impl.CustomerOrderImpl;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.dao.impl.OrderDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.entity.Order;
import cn.dtw.entity.User;
import cn.dtw.service.OrderService;
import cn.dtw.service.customerservice.CustomerOrderService;
import cn.dtw.service.impl.OrderServiceImpl;

public class CustomerOrderServiceImpl implements CustomerOrderService {
	private OrderDao orderDao = new OrderDaoImpl();
	private OrderService orderService = new OrderServiceImpl();
	private ClientContactDao clientContactDao = new ClientContactDaoImpl();
	private CustomerOrderDao customerOrderDao = new CustomerOrderImpl();
	private CustomerDao customerDao = new CustomerDaoImpl();
	private CustomerCostDao customerCostDao = new CustomerCostDaoImpl();
	//通过公司id查询订单信息
	@Override
	public List<Order> getOrderListByClientId(Client client, int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		return customerOrderDao.getOrderListByClientId(client, startRow, pageSize);
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
	//查询订单条数
	@Override
	public int getOrderCount(User user) {
		return orderDao.getOrderCount(user);
	}
	//根据公司id查询订单条数
	@Override
	public int getOrderCount(Client client) {
		return customerOrderDao.getOrderCount(client);
	}
	//通过网站下单人id查询订单信息及付款信息
	@Override
	public List<Order> getPayOrderByCustomerId(Customer customer, int curPage, int rowSize) {
		Customer_client clientId=customerDao.getClientBycust(customer);
		Client client = new Client();
		client.setClientId(clientId.getClientId());
		List<Order> list=customerOrderDao.getOrderListByClientId(client,  (curPage-1)*rowSize, rowSize);
		
		return null;
	}

}
