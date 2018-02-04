package cn.dtw.service.impl;

import cn.dtw.dao.Supplier_contactDao;
import cn.dtw.dao.SuppliercontactDao;
import cn.dtw.dao.impl.Supplier_contactDaoImpl;
import cn.dtw.dao.impl.SuppliercontactDaoImpl;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.Supplier_contactService;

public class Supplier_contactServiceImpl implements Supplier_contactService {
	Supplier_contactDao supplier_contactDao = new Supplier_contactDaoImpl();
	SuppliercontactDao supplierContactDao = new SuppliercontactDaoImpl();
	//删除供应商联系人，并将联系人从表中删除,成功返回1，失败返回0
	@Override
	public int delSupplierContact(Supplier_suppliercontact suppler_Contact) {
		int rs = 0;
		if(supplier_contactDao.delSupplierContact(suppler_Contact)) {
			if(supplierContactDao.delSupplierContactById(suppler_Contact)) {
				rs = 1;
			}
		}
		return rs;
	}
	//添加供应商联系人,成功返回1，失败返回0
	@Override
	public int addSupplierContact(Supplier_suppliercontact supplier_Contact, Suppliercontact suppliercontact) {
		int contactId = supplierContactDao.addSupplierContact(suppliercontact);
		if(contactId>0) {
			supplier_Contact.setSupplierContactId(contactId);
			if(supplier_contactDao.addSupplierContact(supplier_Contact)) {
				return 1;
			};
		}
		return 0;
	}
	//修改联系人
	@Override
	public int updateSupplierContact(Suppliercontact suppliercontact) {
		if(supplierContactDao.updateSupplierContact(suppliercontact)) {
			return 1;
		}
		return 0;
	}

}
