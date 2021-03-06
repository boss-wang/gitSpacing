package cn.dtw.service.customerservice.impl;


import java.util.List;

import cn.dtw.dao.ClientContactDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.dao.customerdao.impl.CustomerDaoImpl;
import cn.dtw.dao.impl.ClientContactDaoImpl;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;
import cn.dtw.service.customerservice.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	CustomerDao customerDao = new CustomerDaoImpl();
	ClientContactDao clientContactDao  = new ClientContactDaoImpl();
	//注册
	@Override
	public int addCustomer(Customer customer) {
		return customerDao.addCustomer(customer);
	}
	//登录(3:用户不存在，1：成功，2：密码错误)
	@Override
	public int loginCustomer(Customer customer) {
	Customer cust1=customerDao.getCustomerByemail(customer);
	Customer cust2=customerDao.getCustomerBytel(customer);
	Customer cust3=customerDao.getCustomerByloginName(customer);
	if(cust1!=null) {
		if(customer.getLoginPwd().equals(cust1.getLoginPwd())) {
			return 1;
		}
		return 2;
	}else if(cust2!=null) {
		if(customer.getLoginPwd().equals(cust2.getLoginPwd())) {
			return 1;
		}
		return 2;
	}else if(cust3!=null) {
		if(customer.getLoginPwd().equals(cust3.getLoginPwd())) {
			return 1;
		}
		return 2;
	}
		return 3;
	}
	@Override
	public Customer getCustomer(Customer customer) {
		Customer cust1=customerDao.getCustomerByemail(customer);
		Customer cust2=customerDao.getCustomerBytel(customer);
		Customer cust3=customerDao.getCustomerByloginName(customer);
		if(cust1!=null) {
			return cust1;
		}else if(cust2!=null) {
			return cust2;
		}else if(cust3!=null) {
			return cust3;
		}else {
			return null;
		}
		
	}
	//根据用户id查询其公司id 然后查出公司的所有联系人
	@Override
	public List<Clientcontact> getAllContactIdByClientId(Customer customer) {
		return customerDao.getAllContactIdByClientId(customer);
	}
	//查询客户信息及审核状态
	@Override
	public List<Customer> getCustomerList(int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		return customerDao.getCustomerList(startRow, pageSize);
	}
	//查询客户总条数
	@Override
	public int getCustomerCount() {
		return customerDao.getCustomerCount();
	}
	//通过下单人查询绑定公司id
	@Override
	public Customer_client getClientBycust(Customer customer) {
		return customerDao.getClientBycust(customer);
	}
	//根据客户id查出客户所有信息
	@Override
	public Customer getCustomerByid(int customerId) {
		// TODO Auto-generated method stub
		return customerDao.getCustomerByid(customerId);
	}
	//修改客户账号的状态
	@Override
	public boolean updateCustomerStatus(Customer customer, int statusId) {
		return customerDao.updateCustomerStatus(customer, statusId);
	}
	//根据下单人id更新手机号
	@Override
	public int updateCustomerPhoneByCustomer(Customer newcustomer, Customer oldcustomer) {
		customerDao.updateTeleByCustomerId(newcustomer);
		clientContactDao.updateClientcontactByCustomer(newcustomer, oldcustomer);
		return 1;
	}
	//根据下单人id更新真实姓名
		@Override
		public int updateRealNameByCustomer(Customer customer) {
			
			return customerDao.updateRealNameByCustomer(customer);
		}
	//根据下单人手机号更新邮箱
		@Override
		public int updateEmailByCustomer(Customer customer) {
			customerDao.updateEmailByPhone(customer);
			clientContactDao.updateClientcontactByCustomer(customer);
			return 1;
		}
	//搜索的总条数
	@Override
	public int searchCustomerCount(String searchContent) {
		return customerDao.searchCustomerCount(searchContent);
	}
	//搜索客户信息及审核状态
	@Override
	public List<Customer> searchCustomerList(String searchContent, int curPage, int pageSize) {
		int startRow = (curPage-1)*pageSize;
		return customerDao.searchCustomerList(searchContent, startRow, pageSize);
	}

	

}
