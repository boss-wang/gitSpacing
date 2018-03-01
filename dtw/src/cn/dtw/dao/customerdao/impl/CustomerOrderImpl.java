package cn.dtw.dao.customerdao.impl;

import java.util.List;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerOrderDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Order;

public class CustomerOrderImpl extends BaseDao implements CustomerOrderDao {
	
	//通过公司id查询订单信息(orderNo,mawbNo,hawbNo,departDate,arriveDate,	destination,customsStatus,cargoPiece,cargoWeight,cargoVolume,statusId)
	@Override
	public List<Order> getOrderListByClientId(Client client, int starPage, int pageSize) {
		String sql="SELECT orderNo,mawbNo,hawbNo,departDate,arriveDate,	destination,customsStatus,cargoPiece,cargoWeight,cargoVolume,statusId FROM `order` WHERE clientId=? limit ?,?";
		Object[] params= {client.getClientId(),starPage,pageSize};
		return super.executeQuery(new BeanListHandler<Order>(Order.class), sql, params);
	}
	//通过订单id查询订单信息(orderNo,mawbNo,hawbNo,cargoPiece,cargoWeight,cargoVolume,destination)
	@Override
	public Order getOrderById(int id) {
		String sql="SELECT orderNo,mawbNo,hawbNo,cargoPiece,cargoWeight,cargoVolume,destination FROM `order` WHERE orderId=?";
		return super.executeOneRow(new BeanHandler<Order>(Order.class), sql, id);
	}
	//通过业务编号查询订单信息
	@Override
	public Order getOrderByOrderNo(String orderNo) {
		String sql="SELECT * FROM `order` WHERE orderNo=?";
		return super.executeOneRow(new BeanHandler<Order>(Order.class), sql, orderNo);
	}
	//通过主单号查询订单信息
	@Override
	public List<Order> getOrderListByMawbNo(String mawbNo) {
		String sql="SELECT * FROM `order` WHERE mawbNo=?";
		return super.executeQuery(new BeanListHandler<Order>(Order.class), sql, mawbNo);
	}
	//添加订单(客户下单)
	@Override
	public boolean addCustomerOrder(Order order) {
		String sql="INSERT INTO `order`(clientId,destination,cargoPiece,cargoWeight,cargoVolume,termsId,loadingPort) VALUES(?,?,?,?,?,?,?);";
		Object[] params= {order.getClientId(),order.getDestination(),order.getCargoPiece(),order.getCargoWeight(),order.getCargoVolume(),order.getTermsId(),order.getLoadingPort()};
		int result=super.executeUpdate(sql, params);
		return result>0?true:false;
	}

}
