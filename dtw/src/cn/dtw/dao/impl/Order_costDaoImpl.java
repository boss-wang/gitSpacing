package cn.dtw.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientDao;
import cn.dtw.dao.CostStatusDao;
import cn.dtw.dao.Order_costDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.CostStatus;
import cn.dtw.entity.Order;
import cn.dtw.entity.Order_cost;

public class Order_costDaoImpl extends BaseDao implements Order_costDao {
	private ClientDao clientDao = new ClientDaoImpl();
	private CostStatusDao costStatusDao = new CostStatusDaoImpl();
	//添加应收
	@Override
	public boolean addOrderCost(Order_cost orderCost) {
		String sql = "insert into order_cost(orderId,clientId,cost,invoiceNo,costStatus) values(?,?,?,?,?)";
		return super.executeUpdate(sql, orderCost.getOrderId(),orderCost.getClientId(),orderCost.getCost(),orderCost.getInvoiceNo(),orderCost.getCostStatus())>0?true:false;
	}
	//根据订单id查询应收
	@Override
	public List<Order_cost> getCostByOrderId(Order order) {
		String sql = "select * from order_cost where orderId=?";
		List<Order_cost> orderCostList = super.executeQuery(new BeanListHandler<Order_cost>(Order_cost.class), sql, order.getOrderId());
		List<Order_cost> orderCostListGet = new ArrayList<Order_cost>();
		//加入客户具体的信息包括联系人
		for(Order_cost orderCost:orderCostList) {
			Client client = new Client();
			client.setClientId(orderCost.getClientId());
			orderCost.setClient(clientDao.getClienttext(client));
			orderCostListGet.add(orderCost);
		}
		return orderCostListGet;
	}
	//修改应收
	@Override
	public boolean updateCost(Order_cost orderCost) {
		String sql = "update order_cost set cost=?,invoiceNo=?,costStatus=? where id=?";
		return super.executeUpdate(sql, orderCost.getCost(),orderCost.getInvoiceNo(),orderCost.getCostStatus(), orderCost.getId())>0?true:false;
	}
	//删除应收
	@Override
	public boolean delCost(Order_cost orderCost) {
		String sql = "delete from order_cost where id=?";
		return super.executeUpdate(sql, orderCost.getId())>0?true:false;
	}
	//根据订单id 和公司id 查询
	@Override
	public List<Order_cost> getOrder_CostByOrderIdAndClientId(Client client, Order order) {
		String sql="select * from  order_cost where orderId=? and clientId=?";
		List<Order_cost> list= super.executeQuery(new BeanListHandler<Order_cost>(Order_cost.class), sql, order.getOrderId(),client.getClientId());
		for(Order_cost order_cost:list) {
			CostStatus coststatus =costStatusDao.getCostStatusById(order_cost);
			order_cost.setStatusName(coststatus);
		}
		return list;
	}
	//根据公司Id查询
	@Override
	public List<Order_cost> getOrder_CostByClientId(Client client, int startSize, int rowSize) {
		String sql="select * from order_cost where clientId=? order by costStatus limit ?,? ";
		return super.executeQuery(new BeanListHandler<Order_cost>(Order_cost.class), sql, client.getClientId(),startSize,rowSize);
	}
	//根据公司Id查询条数
	@Override
	public int getAlltotal(Client client) {
		String sql="select count(1) as count from order_cost where clientId=?";
		Object obj =super.executeOneColumn(new  ScalarHandler("count"), sql, client.getClientId());
		Long m = (Long)obj;
		return m.intValue();
	}
	//根据订单号删除应收
	@Override
	public int delCostByOrder(Order order) {
		String sql = "delete from order_cost where orderId=?";
		return super.executeUpdate(sql, order.getOrderId());
	}

}
