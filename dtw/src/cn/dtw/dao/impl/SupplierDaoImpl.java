package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.SupplierDao;
import cn.dtw.dao.Supplier_contactDao;
import cn.dtw.entity.Supplier;
import cn.dtw.entity.Suppliercontact;

public class SupplierDaoImpl extends BaseDao implements SupplierDao {
	Supplier_contactDao su_contDao = new Supplier_contactDaoImpl();
	//通过公司名查询公司信息
	@Override
	public Supplier getSupplierByName(Supplier supplier) {
		String sql = "select * from supplier where supplierName=?";
		return super.executeOneRow(new BeanHandler<Supplier>(Supplier.class), sql, supplier.getSupplierName());
	}
	//添加供应商
	@Override
	public boolean addSupplier(Supplier supplier) {
		String sql = "insert into supplier(supplierName,supplierAddress) values(?,?)";
		int rs = super.executeUpdate(sql, supplier.getSupplierName(),supplier.getSupplierAddress());
		return rs>0?true:false;
	}
	//分页查询供应商
	@Override
	public List<Supplier> getPageSupplier(int startRow, int pageSize) {
		String sql = "select * from supplier order by supplierId desc limit ?,?";
		return super.executeQuery(new BeanListHandler<Supplier>(Supplier.class), sql, startRow,pageSize);
	}
	//获得总记录条数
	@Override
	public int getTotalRowOfSupplier() {
		String sql = "select count(1) as count from supplier";
		Long rs =  (Long)super.executeOneColumn(new ScalarHandler("count"), sql);
		return rs.intValue();
	}
	//通过id获得供应商信息
	@Override
	public Supplier getSupplierById(Supplier supplier) {
		String sql = "select * from supplier where supplierId=?";
		Supplier supplierGet = super.executeOneRow(new BeanHandler<Supplier>(Supplier.class), sql, supplier.getSupplierId());
		List<Suppliercontact> contacts = su_contDao.getSupplierContactBySupplierId(supplierGet);
		supplierGet.setSupplierContacts(contacts);
		return supplierGet;
	}
	//查询除本身外，是否有重名的供应商,没有返回true，有则返回false
	@Override
	public boolean isExistSupplier(Supplier supplier) {
		String sql = "select supplierName from supplier where supplierId!=? and supplierName=?";
		Object rs = super.executeOneColumn(new ScalarHandler("supplierName"), sql,supplier.getSupplierId(), supplier.getSupplierName());
		return rs==null?true:false;
	}
	//修改供应商
	@Override
	public boolean updateSupplier(Supplier supplier) {
		String sql = "update supplier set supplierName=?,supplierAddress=? where supplierId=?";
		return super.executeUpdate(sql, supplier.getSupplierName(),supplier.getSupplierAddress(),supplier.getSupplierId())>0?true:false;
	}
	//删除供应商
	@Override
	public boolean delSupplier(Supplier supplier) {
		String sql = "delete from supplier where supplierId=?";
		return super.executeUpdate(sql, supplier.getSupplierId())>0?true:false;
	}
	//模糊查询供应商公司名
	@Override
	public List<Supplier> getSupplierByName(String SupplierName) {
		String sql = "select * from supplier where supplierName like concat('%',?,'%')";
		return super.executeQuery(new BeanListHandler<Supplier>(Supplier.class), sql, SupplierName);
	}

}
