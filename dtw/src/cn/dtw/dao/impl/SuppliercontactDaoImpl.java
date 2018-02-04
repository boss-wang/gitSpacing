package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.SuppliercontactDao;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;

public class SuppliercontactDaoImpl extends BaseDao implements SuppliercontactDao {

	//删除联系人(供应商)
	@Override
	public boolean delSupplierContactById(Supplier_suppliercontact suppler_Contact) {
		String sql = "delete from suppliercontact where supplierContactId=?";
		return super.executeUpdate(sql, suppler_Contact.getSupplierContactId())>0?true:false;
	}
	//添加联系人（供应商）并返回联系人id
	@Override
	public int addSupplierContact(Suppliercontact suppliercontact) {
		String sql = "insert into suppliercontact(supplierContactEmail,supplierContactName,supplierContactQQ,supplierContactTel) values(?,?,?,?)";
		return super.executeUpdateAndReturnId(sql, suppliercontact.getSupplierContactEmail(),suppliercontact.getSupplierContactName(),suppliercontact.getSupplierContactQQ(),suppliercontact.getSupplierContactTel());
	}
	//修改联系人
	@Override
	public boolean updateSupplierContact(Suppliercontact suppliercontact) {
		String sql = "update suppliercontact set supplierContactEmail=?,supplierContactQQ=?,supplierContactTel=? where supplierContactId=?";
		return super.executeUpdate(sql, suppliercontact.getSupplierContactEmail(),suppliercontact.getSupplierContactQQ(),suppliercontact.getSupplierContactTel(),suppliercontact.getSupplierContactId())>0?true:false;
	}

}
