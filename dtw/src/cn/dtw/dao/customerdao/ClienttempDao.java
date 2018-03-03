package cn.dtw.dao.customerdao;

import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;
import cn.dtw.entity.Customer;

public interface ClienttempDao {
		//添加临时公司并返回公司id
		int addClienttemp(Clienttemp clienttemp);
		//修改临时公司存在状态
		public boolean updateExists(Clienttemp_customer clienttemp_customer,int existsStatus);
		//添加临时公司id和对应客户id
		int addClienttemp_customer(Clienttemp_customer clienttemp_customer );
		//通过客户id查询其对应临时公司信息
		public Clienttemp getClienttempByCustomer(Customer customer);
}
