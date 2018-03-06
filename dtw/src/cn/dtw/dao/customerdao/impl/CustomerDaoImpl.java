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

	//查询客户信息及审核状态
	@Override
	public List<Customer> getCustomerList(int startRow, int pageSize) {
		String sql = "select loginName,loginPwd,tel,email,statusId,customer.id as id,clientExists,realName from customer left join clienttemp_customer on customer.id=clienttemp_customer.customerId order by statusId limit ?,?";
		List<Customer> list = super.executeQuery(new BeanListHandler<Customer>(Customer.class), sql, startRow,pageSize);
		List<Customer> customerList = new ArrayList<Customer>();
		//保存临时公司信息
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
	//修改客户账号的状态
	@Override
	public boolean updateCustomerStatus(Customer customer,int statusId) {
		String sql = "update customer set statusId=? where id=?";
		return super.executeUpdate(sql, statusId,customer.getId())>0?true:false;
	}
	//根据下单人id更新真实姓名
	@Override
	public int updateRealNameByCustomer(Customer customer) {
		String sql="update customer set realName=? where id=?";
		return super.executeUpdate(sql, customer.getRealName(),customer.getId());
	}
	//根据下单人id更新手机号
	@Override
	public int updateTeleByCustomerId(Customer customer) {
		String sql="update customer set tel=? where id=?";
		return super.executeUpdate(sql,customer.getTel(),customer.getId());
	}
	//根据下单人手机号更新邮箱
	@Override
	public int updateEmailByPhone(Customer customer) {
		String sql="update customer set email=? where tel=?";
		return super.executeUpdate(sql, customer.getEmail(),customer.getTel());
	}
	//搜索注册的用户
	@Override
	public List<Customer> searchCustomerList(String searchContent, int startRow, int pageSize) {
		String sql = "select loginName,loginPwd,tel,email,statusId,customer.id as id,clientExists,realName from customer left join clienttemp_customer on customer.id=clienttemp_customer.customerId "
				+ "where loginName like concat('%',?,'%') or tel like concat('%',?,'%') or email like concat('%',?,'%') or realName like concat('%',?,'%') order by statusId limit ?,?";
		List<Customer> list = super.executeQuery(new BeanListHandler<Customer>(Customer.class), sql,searchContent,searchContent,searchContent,searchContent, startRow,pageSize);
		List<Customer> customerList = new ArrayList<Customer>();
		//保存临时公司信息
		for(Customer customer:list) {
			customer.setClientTemp(clienttempDao.getClienttempByCustomer(customer));
			customerList.add(customer);
		}
		return customerList;
	}
	//搜索的客户总条数
	@Override
	public int searchCustomerCount(String searchContent) {
		String sql = "select count(1) as count from customer where loginName like concat('%',?,'%') or tel like concat('%',?,'%') or email like concat('%',?,'%') or realName like concat('%',?,'%')";
		Long rs = (Long)super.executeOneColumn(new ScalarHandler("count"), sql,searchContent,searchContent,searchContent,searchContent);
		return rs.intValue();
	}
	
	
}
