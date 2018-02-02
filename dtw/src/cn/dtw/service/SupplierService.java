package cn.dtw.service;

import java.util.List;

import cn.dtw.entity.Supplier;

public interface SupplierService {
	//通过公司名查询公司信息
	public Supplier getSupplierByName(Supplier supplier);
	//添加供应商
	public boolean addSupplier(Supplier supplier);
	//查询分页供应商
	public List<Supplier> getPageSupplier(int page,int pageSize);
	//获得总记录条数
	public int getTotalRowOfSupplier();
}
