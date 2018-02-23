package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.OrderDao;
import cn.dtw.entity.Order;

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

}
