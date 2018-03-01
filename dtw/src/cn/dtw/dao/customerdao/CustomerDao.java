package cn.dtw.dao.customerdao;

import java.util.List;

import cn.dtw.entity.Customer;

public interface CustomerDao {
	//添加用户
	int addCustomer(Customer customer);
	//根据邮箱查询
	Customer getCustomerByemail(Customer customer);
	//根据用户名查询
	Customer getCustomerByloginName(Customer customer);
	//根据手机号查询
	Customer getCustomerBytel(Customer customer);
}
