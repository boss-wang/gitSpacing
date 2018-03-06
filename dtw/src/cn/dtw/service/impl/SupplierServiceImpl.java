package cn.dtw.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.SupplierDao;
import cn.dtw.dao.Supplier_contactDao;
import cn.dtw.dao.impl.SupplierDaoImpl;
import cn.dtw.dao.impl.Supplier_contactDaoImpl;
import cn.dtw.entity.Supplier;
import cn.dtw.entity.Supplier_suppliercontact;
import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.SupplierService;
import cn.dtw.service.Supplier_contactService;

public class SupplierServiceImpl implements SupplierService {
	SupplierDao suDao = new SupplierDaoImpl();
	Supplier_contactDao su_contDao = new Supplier_contactDaoImpl();
	//通过公司名查询供应商信息
	@Override
	public Supplier getSupplierByName(Supplier supplier) {
		return suDao.getSupplierByName(supplier);
	}
	//添加供应商
	@Override
	public boolean addSupplier(Supplier supplier) {
		return suDao.addSupplier(supplier);
	}
	//查询分页供应商
	@Override
	public List<Supplier> getPageSupplier(int page, int pageSize) {
		int startRow = (page-1)*pageSize;
		List<Supplier> list = suDao.getPageSupplier(startRow, pageSize);
		List<Supplier> supplierList = new ArrayList<Supplier>();
		//添加联系人信息
		for(Supplier supplier:list) {
			List<Suppliercontact> contacts = su_contDao.getSupplierContactBySupplierId(supplier);
			supplier.setSupplierContacts(contacts);
			supplierList.add(supplier);
		}
		return supplierList;
	}
	//获得总记录条数
	@Override
	public int getTotalRowOfSupplier() {
		return suDao.getTotalRowOfSupplier();
	}
	//通过id查询供应商信息
	@Override
	public Supplier getSupplierById(Supplier supplier) {
		return suDao.getSupplierById(supplier);
	}
	//修改供应商,若公司名存在则返回0，若修改失败返回2，修改成功返回1
	@Override
	public int updateSupplier(Supplier supplier) {
		if(suDao.isExistSupplier(supplier)) {
			if(suDao.updateSupplier(supplier)) {
				return 1;
			}
			return 2;
		};
		return 0;
	}
	//删除供应商，及其联系人
	@Override
	public int delSupplier(Supplier supplier) {
		Supplier_contactService su_conService = new Supplier_contactServiceImpl();
		Supplier_suppliercontact suppler_Contact;
		//查出此供应商所有联系人，并删除
		List<Suppliercontact> suContactList = su_contDao.getSupplierContactBySupplierId(supplier);
		for(Suppliercontact supContact:suContactList) {
			suppler_Contact = new Supplier_suppliercontact();
			suppler_Contact.setSupplierContactId(supContact.getSupplierContactId());
			suppler_Contact.setSupplierId(supplier.getSupplierId());
			su_conService.delSupplierContact(suppler_Contact);
		}
		suDao.delSupplier(supplier);
		return 1;
	}
	//模糊查询供应商公司名
	@Override
	public List<Supplier> getSupplierByName(String SupplierName) {
		return suDao.getSupplierByName(SupplierName);
	}
	//搜索供应商
	@Override
	public List<Supplier> searchSupplier(String searchContent, int page, int pageSize) {
		int startRow = (page-1)*pageSize;
		List<Supplier> list = suDao.searchSupplier(searchContent, startRow, pageSize);
		List<Supplier> supplierList = new ArrayList<Supplier>();
		//添加联系人信息
		for(Supplier supplier:list) {
			List<Suppliercontact> contacts = su_contDao.getSupplierContactBySupplierId(supplier);
			supplier.setSupplierContacts(contacts);
			supplierList.add(supplier);
		}
		return supplierList;
	}
	//搜索的条数
	@Override
	public int getSearchRowOfSupplier(String searchContent) {
		return suDao.getSearchRowOfSupplier(searchContent);
	}

}
