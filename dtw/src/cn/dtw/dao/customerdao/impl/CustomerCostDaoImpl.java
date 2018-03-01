package cn.dtw.dao.customerdao.impl;

import java.util.List;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.CustomerCostDao;
import cn.dtw.entity.Client;
import cn.dtw.entity.Order_cost;

public class CustomerCostDaoImpl extends BaseDao implements CustomerCostDao {
	
	//通过客户id查询其应收信息，并加入订单信息
	@Override
	public List<Order_cost> getCustomerCostByClientId(Client client) {
		// TODO Auto-generated method stub
		String sql="";
		return null;
	}

}
