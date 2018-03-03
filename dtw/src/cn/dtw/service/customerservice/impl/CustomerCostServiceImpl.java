package cn.dtw.service.customerservice.impl;

import java.util.List;

import cn.dtw.dao.customerdao.CustomerCostDao;
import cn.dtw.dao.customerdao.impl.CustomerCostDaoImpl;
import cn.dtw.entity.Client;
import cn.dtw.entity.Order_cost;
import cn.dtw.service.customerservice.CustomerCostService;

public class CustomerCostServiceImpl implements CustomerCostService {
	CustomerCostDao customerCostDao=new CustomerCostDaoImpl();
	//通过客户id查询其应付信息
	@Override
	public List<Order_cost> getCustomerCostByClientId(Client client) {
		// TODO Auto-generated method stub
		return null;
	}

}
