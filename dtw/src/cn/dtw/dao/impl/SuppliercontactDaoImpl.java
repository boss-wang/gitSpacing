package cn.dtw.dao.impl;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.SuppliercontactDao;
import cn.dtw.entity.Supplier_suppliercontact;

public class SuppliercontactDaoImpl extends BaseDao implements SuppliercontactDao {

	//删除联系人(供应商)
	@Override
	public boolean delSupplierContactById(Supplier_suppliercontact suppler_Contact) {
		String sql = "delete from suppliercontact where supplierContactId=?";
		return super.executeUpdate(sql, suppler_Contact.getSupplierContactId())>0?true:false;
	}

}
