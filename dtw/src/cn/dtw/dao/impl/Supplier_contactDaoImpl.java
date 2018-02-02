package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.Supplier_contactDao;
import cn.dtw.entity.Supplier;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;

public class Supplier_contactDaoImpl extends BaseDao implements Supplier_contactDao {

	//查询供应商的联系人
	@Override
	public List<Suppliercontact> getSupplierContactBySupplierId(Supplier supplier) {
		String sql = "select supplierContactEmail,Suppliercontact.supplierContactId,supplierContactName,supplierContactQQ,supplierContactTel "
				+ "from Suppliercontact,Supplier_suppliercontact "
				+ "where Supplier_suppliercontact.supplierContactId=Suppliercontact.supplierContactId "
				+ "and supplierId=?";
		return super.executeQuery(new BeanListHandler<Suppliercontact>(Suppliercontact.class), sql, supplier.getSupplierId());

	}
}
