package cn.dtw.dao.customerdao.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerOrderDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Order;

public class CustomerOrderImpl extends BaseDao implements CustomerOrderDao {

	@Override
	public List<Order> getOrderListByClientId(Client client, int curPage, int pageSize) {
		String sql="select * from order where clientId=? limit ?,?";
		Object[] params= {client.getClientId(),curPage,pageSize};
		return super.executeQuery(new BeanListHandler<Order>(Order.class), sql, params);
	}

	@Override
	public Order getOrderById(int id) {
		String sql="select * from order where orderId=? ";
		
		return super.executeOneRow(new BeanHandler<Order>(Order.class), sql, id);
	}

	@Override
	public Order getOrderByOrderNo(String orderNo) {
		String sql="select * from order where orderNo=?";
		
		return super.executeOneRow(new BeanHandler<Order>(Order.class), sql, orderNo);
	}

	@Override
	public List<Order> getOrderListByMawbNo(String mawbNo) {
		String sql="select * from order where mawbNo=?";
		return super.executeQuery(new BeanListHandler<Order>(Order.class), sql, mawbNo);
	}

	@Override
	public boolean addCustomerOrder(Order order) {
	
		String sql="insert into order(departDate,destination,cargoPiece,"
				+ "cargoWeight,cargoVolume,termsId,orderNo,loadingPort)";
		
		Object[] params= {order.getDepartDate(),order.getDestination(),order.getCargoPiece(),order.getCargoWeight(),order.getCargoVolume()
				,order.getTermsId(),order.getOrderNo(),order.getLoadingPort()};
		int result=super.executeUpdate(sql, params);
		
	
		return result>0?true:false;
	}

}
