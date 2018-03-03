package cn.dtw.dao.customerdao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.customerdao.ClienttempDao;
import cn.dtw.dao.customerdao.CustomerDao;
import cn.dtw.entity.Clientcontact;
import cn.dtw.entity.Customer;
import cn.dtw.entity.Customer_client;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {
	private ClienttempDao clienttempDao = new ClienttempDaoImpl();
	//注册
	@Override
	public int addCustomer(Customer customer) {
		String sql="INSERT INTO customer(loginName,loginPwd,tel,email,statusId) VALUES(?,?,?,?,?)";
		return super.executeUpdate(sql,customer.getLoginName(),customer.getLoginPwd(),customer.getTel(),customer.getEmail(),customer.getStatusId());
		
	}
	//登录查询
	@Override
	public Customer getCustomerByemail(Customer customer) {
		String sql="select * from customer where email=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql, customer.getEmail());
	}

	@Override
	public Customer getCustomerByloginName(Customer customer) {
		String sql="select * from customer where loginName=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql, customer.getLoginName());
	}

	@Override
	public Customer getCustomerBytel(Customer customer) {
		String sql="select * from customer where tel=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql,  customer.getTel());
	}
	//根据下单人id查询客户公司id
	@Override
	public Customer_client getClientBycust(Customer customer) {
		String sql="select * from customer_client where customerId=?";
		return super.executeOneRow(new BeanHandler<Customer_client>(Customer_client.class), sql, customer.getId());
	}
	//根据客户公司id获取公司的所有联系人
	@Override
	public List<Clientcontact> getAllContactIdByClientId(Customer customer) {
		String sql = "select clientContactEmail,clientcontact.clientContactId,clientContactName,clientContactQQ,clientContactTel "
				+ "from clientcontact,client_clientcontact "
				+ "where client_clientcontact.clientContactId=clientcontact.clientContactId "
				+ "and clientId=(select clientId from customer_client where customerId=?)";
		return super.executeQuery(new BeanListHandler<Clientcontact>(Clientcontact.class), sql, customer.getId());
	}
	@Override
	public int updateStatusByid(Customer customer) {
		String sql ="update customer set statusId=? where id=?";
		return super.executeUpdate(sql, customer.getStatusId(),customer.getId());
	}
	//查询客户信息及审核状态
	@Override
	public List<Customer> getCustomerList(int startRow, int pageSize) {
		String sql = "select loginName,loginPwd,tel,email,statusId,customer.id as id,clientExists from customer left join clienttemp_customer on customer.id=clienttemp_customer.customerId order by statusId limit ?,?";
		List<Customer> list = super.executeQuery(new BeanListHandler<Customer>(Customer.class), sql, startRow,pageSize);
		List<Customer> customerList = new ArrayList<Customer>();
		for(Customer customer:list) {
			customer.setClientTemp(clienttempDao.getClienttempByCustomer(customer));
			customerList.add(customer);
		}
		return customerList;
	}
	//查询客户总条数
	@Override
	public int getCustomerCount() {
		String sql = "select count(1) as count from customer";
		Long rs = (Long)super.executeOneColumn(new ScalarHandler("count"), sql);
		return rs.intValue();
	}
	//根据客户id查出客户所有信息
	@Override
	public Customer getCustomerByid(int customerId) {
		String sql = "select * from customer where id=?";
		return super.executeOneRow(new BeanHandler<Customer>(Customer.class), sql, customerId);
	}
	
	
}
