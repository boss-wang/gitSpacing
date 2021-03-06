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
	//删除供应商单个联系人
	@Override
	public boolean delSupplierContact(Supplier_suppliercontact suppler_Contact) {
		String sql = "delete from supplier_suppliercontact where supplierContactId=? and supplierId=?";
		return super.executeUpdate(sql, suppler_Contact.getSupplierContactId(),suppler_Contact.getSupplierId())>0?true:false;
	}
	//添加供应商联系人
	@Override
	public boolean addSupplierContact(Supplier_suppliercontact suppler_Contact) {
		String sql = "insert into supplier_suppliercontact(supplierContactId,supplierId) values(?,?)";
		return super.executeUpdate(sql, suppler_Contact.getSupplierContactId(),suppler_Contact.getSupplierId())>0?true:false;
	}
}
