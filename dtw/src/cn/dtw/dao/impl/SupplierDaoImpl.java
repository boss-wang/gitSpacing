package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.SupplierDao;
import cn.dtw.entity.Supplier;

public class SupplierDaoImpl extends BaseDao implements SupplierDao {
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

}
