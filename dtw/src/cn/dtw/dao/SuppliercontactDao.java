package cn.dtw.dao;

import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;

public interface SuppliercontactDao {
	//删除联系人(供应商)
	public boolean delSupplierContactById(Supplier_suppliercontact suppler_Contact);
	//添加联系人（供应商）并返回联系人id
	public int addSupplierContact(Suppliercontact suppliercontact);
}
