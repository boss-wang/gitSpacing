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
	//通过id获得供应商信息
	public Supplier getSupplierById(Supplier supplier);
	//修改供应商,若公司名存在则返回0，若修改失败返回2，修改成功返回1
	public int updateSupplier(Supplier supplier);
}
