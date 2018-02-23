package cn.dtw.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientDao;
import cn.dtw.dao.CustomsStatusDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.dao.OrderStatusDao;
import cn.dtw.dao.TermsDao;
import cn.dtw.entity.Order;
import cn.dtw.entity.User;

public class OrderDaoImpl extends BaseDao implements OrderDao {
	
	//添加订单
	@Override
	public boolean addOrder(Order order) {
		String sql = "insert into `order`(arriveDate,cargoPiece,cargoVolume,cargoWeight,chargeWeight,clientId,customsNo,customsStatus,departDate,destination,flightNo,hawbNo,mawbNo,orderNo,remarks,statusId,systemNo,updateTime,userId,termsId) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return super.executeUpdate(sql, order.getArriveDate(),order.getCargoPiece(),order.getCargoVolume(),
				order.getCargoWeight(),order.getChargeWeight(),order.getClientId(),order.getCustomsNo(),order.getCustomsStatus(),order.getDepartDate(),order.getDestination(),
				order.getFlightNo(),order.getHawbNo(),order.getMawbNo(),order.getOrderNo(),order.getRemarks(),order.getStatusId(),order.getSystemNo(),order.getUpdateTime(),order.getUserId(),order.getTermsId())>0?true:false;
	}
	//查询订单列表
	@Override
	public List<Order> getOrderList(User user,int startRow,int pageSize) {
		String sql = "select * from `order` where userId=? order by orderId desc limit ?,?";
		List<Order> list = super.executeQuery(new BeanListHandler<Order>(Order.class), sql, user.getUserId(),startRow,pageSize);
		List<Order> orderList = new ArrayList<Order>();
		ClientDao clientDao = new ClientDaoImpl();
		CustomsStatusDao cusStatusDao = new CustomsStatusDaoImpl();
		OrderStatusDao orderStatusDao = new OrderStatusDaoImpl();
		TermsDao termsDao = new TermsDaoImpl();
		for(Order order:list) {
			order.setClient(clientDao.getClient(order));
			order.setCusStatus(cusStatusDao.getCustomsStatusById(order));
			order.setOrderStatus(orderStatusDao.getOrderStatusById(order));
			order.setTerms(termsDao.getTermsById(order));
			orderList.add(order);
		}
		return orderList;
	}
	//查询订单条数
	@Override
	public int getOrderCount(User user) {
		String sql = "select count(1) as count from `order` where userId=?";
		Long rs = (Long)super.executeOneColumn(new ScalarHandler("count"), sql, user.getUserId());
		return rs.intValue();
	}

}
