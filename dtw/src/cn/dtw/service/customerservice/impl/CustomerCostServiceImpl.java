package cn.dtw.service.customerservice.impl;

import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.CostStatusDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.Order_costDao;
import cn.dtw.dao.customerdao.CustomerCostDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.impl.CustomerCostDaoImpl;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.dao.impl.CostStatusDaoImpl;
import cn.dtw.dao.impl.OrderDaoImpl;
import cn.dtw.dao.impl.Order_costDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.entity.Order;
import cn.dtw.entity.Order_cost;
import cn.dtw.service.customerservice.CustomerCostService;

public class CustomerCostServiceImpl implements CustomerCostService {
	CustomerCostDao customerCostDao=new CustomerCostDaoImpl();
	private CustomerDao customerDao = new CustomerDaoImpl();
	private   Order_costDao order_costDao = new Order_costDaoImpl();
	private OrderDao orderDao = new OrderDaoImpl();
	private CostStatusDao costStatusDao = new CostStatusDaoImpl();
	private ClientContactDao clientContactDao = new ClientContactDaoImpl();
	//通过客户id查询其应付信息
	@Override
	public List<Order_cost> getCustomerCostByClientId(Client client) {
		// TODO Auto-generated method stub
		return null;
	}
	//通过网站下单人id查询订单信息及付款信息
		@Override
		public List<Order_cost> getPayOrderByCustomerId(Customer customer, int curPage, int rowSize) {
			Customer_client clientId=customerDao.getClientBycust(customer);
			Client client = new Client();
			client.setClientId(clientId.getClientId());
			List<Order_cost> list=order_costDao.getOrder_CostByClientId(client,  (curPage-1)*rowSize, rowSize);
			for(Order_cost cost:list) {
				Order order = orderDao.getOrderById(cost.getOrderId());
				if(order!=null) {
					Clientcontact cc = clientContactDao.getClientContactById(order.getOrderClientContactId());
					order.setClientcontact(cc);
				}
				cost.setOrder(order);
				CostStatus  costStatus=costStatusDao.getCostStatusById(cost);
				cost.setStatusName(costStatus);
			}
			return list;
		}
		//根据下单人id查询订单条数
		@Override
		public int getPayOrderCountByCustomerId(Customer customer) {
			Customer_client clientId=customerDao.getClientBycust(customer);
			Client client = new Client();
			client.setClientId(clientId.getClientId());
			return order_costDao.getAlltotal(client);
		}
		//修改付款状态
		@Override
		public boolean updateCostStatus(int costId, int costStatus) {
			return customerCostDao.updateCostStatus(costId, costStatus);
		}

}
