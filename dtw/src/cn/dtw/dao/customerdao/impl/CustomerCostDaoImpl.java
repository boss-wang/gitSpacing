package cn.dtw.dao.customerdao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerCostDao;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Order_cost;

public class CustomerCostDaoImpl extends BaseDao implements CustomerCostDao {
	
	//通过客户id查询其应收信息，并加入订单信息
	@Override
	public List<Order_cost> getCustomerCostByClientId(Customer customer) {
		// TODO Auto-generated method stub
		String sql="SELECT orderId,client.clientName,cost,invoiceNo,coststatus.`name` FROM order_cost INNER JOIN client ON order_cost.clientId=client.clientId INNER JOIN coststatus ON order_cost.costStatus=coststatus.id WHERE order_cost.clientId=(SELECT customer_client.clientId FROM customer INNER JOIN customer_client ON customer.id=customer_client.customerId WHERE customer.id=?)";
		return super.executeQuery(new BeanListHandler<Order_cost>(Order_cost.class),sql,customer.getId());
	}
	//修改付款状态
	@Override
	public boolean updateCostStatus(int costId, int costStatus) {
		String sql = "update order_cost set costStatus=? where id=?";
		return super.executeUpdate(sql, costStatus,costId)>0?true:false;
	}

}
