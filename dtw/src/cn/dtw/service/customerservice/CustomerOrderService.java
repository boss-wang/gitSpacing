package cn.dtw.service.customerservice;

import java.util.List;

import cn.dtw.entity.Client;
import cn.dtw.entity.Order;

public interface CustomerOrderService {
	//通过公司id查询订单信息(orderNo,mawbNo,hawbNo,departDate,arriveDate,	destination,cusStatus,cargoPiece,cargoWeight,cargoVolume,orderStatus)
	public List<Order> getOrderListByClientId(Client client,int curPage,int pageSize);
	//通过订单id查询订单信息(orderNo,mawbNo,hawbNo,cargoPiece,cargoWeight,cargoVolume,destination)
	public Order getOrderById(int id);
	//通过业务编号查询订单信息
	public Order getOrderByOrderNo(String orderNo);
	//通过主单号查询订单信息
	public List<Order> getOrderListByMawbNo(String mawbNo);
	//添加订单(客户下单)
	public boolean addCustomerOrder(Order order);
}