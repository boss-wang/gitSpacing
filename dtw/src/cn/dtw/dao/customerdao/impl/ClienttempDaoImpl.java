package cn.dtw.dao.customerdao.impl;

import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.ClienttempDao;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.Customer;

public class ClienttempDaoImpl extends BaseDao implements ClienttempDao  {

	@Override
	public int addClienttemp(Clienttemp clienttemp) {
		String sql="insert into clienttemp (clientName,clientAddress) values(?,?)";
		return super.executeUpdateAndReturnId(sql, clienttemp.getClientName(),clienttemp.getClientAddress());
	}

	@Override
	public int addClienttemp_customer(Clienttemp_customer clienttemp_customer) {
		String sql="insert into clienttemp_customer (customerId,clientId,clientExists) values(?,?,?)";
		return super.executeUpdate(sql, clienttemp_customer.getCustomerId(),clienttemp_customer.getClientId(),clienttemp_customer.getClientExists());
	}
	//通过客户id查询其对应临时公司信息
	@Override
	public Clienttemp getClienttempByCustomer(Customer customer) {
		String sql = "select * from clienttemp where clienttemp.clientId=(select clientId from clienttemp_customer where customerId=? )";
		return super.executeOneRow(new BeanHandler<Clienttemp>(Clienttemp.class), sql, customer.getId());
	}
	//修改临时公司存在状态
	@Override
	public boolean updateExists(Clienttemp_customer clienttemp_customer,int existsStatus) {
		String sql = "update clienttemp_customer set clientExists=? where clientId=?";
		return super.executeUpdate(sql, existsStatus,clienttemp_customer.getClientId())>0?true:false;
	}
	//根据客户id删除其临时公司
	@Override
	public boolean delClienttempByCustomer(Customer customer) {
		String sql = "delete from clienttemp_customer where customerId=?";
		return super.executeUpdate(sql, customer.getId())>0?true:false;
	}
	//删除临时公司
	@Override
	public boolean delClienttemp(Clienttemp clienttemp) {
		String sql = "delete from clienttemp where clientId=?";
		return super.executeUpdate(sql, clienttemp.getClientId())>0?true:false;
	}

}
