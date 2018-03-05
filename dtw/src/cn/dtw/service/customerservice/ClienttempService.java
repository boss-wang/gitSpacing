package cn.dtw.service.customerservice;

import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.Customer;

public interface ClienttempService {
	//添加临时公司id和对应客户id,同时判断是否存在，修改绑定状态
	int addClienttemp_customer(Clienttemp_customer clienttemp_customer ,Clienttemp clienttemp);
	//修改临时公司存在状态
	public boolean updateExists(Clienttemp_customer clienttemp_customer,int existsStatus);
	//删除绑定失败的客户对应的临时公司信息
	public boolean delClienttempByCustomer(Customer customer);
}
