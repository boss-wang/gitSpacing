package cn.dtw.dao.customerdao.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.customerdao.CustomerOrderDao;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Order;

public class CustomerOrderImpl extends BaseDao implements CustomerOrderDao {
	private ClientContactDao clientContactDao = new ClientContactDaoImpl();
	//通过公司id查询订单信息(orderNo,mawbNo,hawbNo,departDate,arriveDate,	destination,customsStatus,cargoPiece,cargoWeight,cargoVolume,statusId)
	@Override
	public List<Order> getOrderListByClientId(Client client, int starPage, int pageSize) {
		String sql="SELECT updateTime,orderClientContactId,orderNo,mawbNo,hawbNo,termsId,departDate,arriveDate,	destination,customsStatus,cargoPiece,cargoWeight,cargoVolume,statusId,loadingPort FROM `order` WHERE clientId=? order by statusId, updateTime desc limit ?,?";
		Object[] params= {client.getClientId(),starPage,pageSize};
		List<Order> list = super.executeQuery(new BeanListHandler<Order>(Order.class), sql, params);
		List<Order> listGet = new ArrayList<Order>();
		for(Order order:list) {
			Clientcontact cc = clientContactDao.getClientContactById(order.getOrderClientContactId());
			order.setClientcontact(cc);
			listGet.add(order);
		}
		return listGet;
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
		String sql="INSERT INTO `order`(clientId,orderNo,destination,departDate,cargoPiece,cargoWeight,cargoVolume,termsId,loadingPort) VALUES(?,?,?,?,?,?,?,?,?);";
		Object[] params= {order.getClientId(),order.getOrderNo(),order.getDestination(),order.getDepartDate(),order.getCargoPiece(),order.getCargoWeight(),order.getCargoVolume(),order.getTermsId(),order.getLoadingPort()};
		int result=super.executeUpdate(sql, params);
		return result>0?true:false;
	}
	//根据公司id查询订单条数
	@Override
	public int getOrderCount(Client client) {
		String sql = "select count(1) as count from `order` where clientId=?";
		Long rs = (Long)super.executeOneColumn(new ScalarHandler("count"), sql, client.getClientId());
		return rs.intValue();
	}
	
	
}
