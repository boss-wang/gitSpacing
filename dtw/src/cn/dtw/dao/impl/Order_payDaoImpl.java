package cn.dtw.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.Order_payDao;
import cn.dtw.dao.SupplierDao;
import cn.dtw.entity.Order;
import cn.dtw.entity.Order_pay;
import cn.dtw.entity.Supplier;

public class Order_payDaoImpl extends BaseDao implements Order_payDao {
	private SupplierDao supplierDao = new SupplierDaoImpl();
	//添加应付
	@Override
	public boolean addOrderPay(Order_pay orderPay) {
		String sql = "insert into order_pay(orderId,supplierId,unitPrice,otherPrice,totalPrice,invoiceNo,payStatus) values(?,?,?,?,?,?,?)";
		return super.executeUpdate(sql, orderPay.getOrderId(),orderPay.getSupplierId(),orderPay.getUnitPrice(),orderPay.getOtherPrice(),orderPay.getTotalPrice(),orderPay.getInvoiceNo(),orderPay.getPayStatus())>0?true:false;
	}
	//根据订单id查询应付
	@Override
	public List<Order_pay> getPayByOrderId(Order order) {
		String sql = "select * from order_pay where orderId=?";
		List<Order_pay> orderPayList = super.executeQuery(new BeanListHandler<Order_pay>(Order_pay.class), sql, order.getOrderId());
		List<Order_pay> orderPayListGet = new ArrayList<Order_pay>();
		//加入客户具体的信息包括联系人
		for(Order_pay orderPay:orderPayList) {
			Supplier supplier = new Supplier();
			supplier.setSupplierId(orderPay.getSupplierId());
			orderPay.setSupplier(supplierDao.getSupplierById(supplier));
			orderPayListGet.add(orderPay);
		}
		return orderPayListGet;
	}
	//删除应付
	@Override
	public boolean delPay(Order_pay orderPay) {
		String sql = "delete from order_pay where id=?";
		return super.executeUpdate(sql, orderPay.getId())>0?true:false;
	}
	//修改应付
	@Override
	public boolean updatePay(Order_pay orderPay) {
		String sql = "update order_pay set unitPrice=?,otherPrice=?,totalPrice=?,invoiceNo=?,payStatus=? where id=?";
		return super.executeUpdate(sql, orderPay.getUnitPrice(),orderPay.getOtherPrice(),orderPay.getTotalPrice(),orderPay.getInvoiceNo(),orderPay.getPayStatus(),orderPay.getId())>0?true:false;
	}
	//根据订单号删除应付
	@Override
	public int delPayByOrder(Order order) {
		String sql = "delete from order_pay where orderId=?";
		return super.executeUpdate(sql, order.getOrderId());
	}

}
