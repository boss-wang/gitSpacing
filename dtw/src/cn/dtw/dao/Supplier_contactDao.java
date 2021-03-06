package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Supplier;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;

public interface Supplier_contactDao {
	//查询供应商的联系人
	public List<Suppliercontact> getSupplierContactBySupplierId(Supplier supplier);
	//删除供应商的联系人
	public boolean delSupplierContact(Supplier_suppliercontact suppler_Contact);
	//添加供应商联系人
	public boolean addSupplierContact(Supplier_suppliercontact suppler_Contact);
}
