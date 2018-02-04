package cn.dtw.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.dtw.dao.SupplierDao;
import cn.dtw.dao.Supplier_contactDao;
import cn.dtw.dao.impl.SupplierDaoImpl;
import cn.dtw.dao.impl.Supplier_contactDaoImpl;
import cn.dtw.entity.Supplier;
import cn.dtw.entity.Suppliercontact;
import cn.dtw.service.SupplierService;

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

}
