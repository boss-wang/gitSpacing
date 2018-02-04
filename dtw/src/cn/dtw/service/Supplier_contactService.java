package cn.dtw.service;

import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;

public interface Supplier_contactService {
	//删除供应商联系人，并将联系人从表中删除,成功返回1，失败返回0
	public int delSupplierContact(Supplier_suppliercontact suppler_Contact);
	//添加供应商联系人 成功返回1，失败返回0
	public int addSupplierContact(Supplier_suppliercontact supplier_Contact,Suppliercontact suppliercontact);
}
