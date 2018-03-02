package cn.dtw.dao.customerdao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.ClienttempDao;
import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;

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

}
