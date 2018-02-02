package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Supplier;
import cn.dtw.entity.Suppliercontact;

public interface Supplier_contactDao {
	//查询供应商的联系人
	public List<Suppliercontact> getSupplierContactBySupplierId(Supplier supplier);
}
