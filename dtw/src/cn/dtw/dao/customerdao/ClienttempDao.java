package cn.dtw.dao.customerdao;

import cn.dtw.entity.Clienttemp;
import cn.dtw.entity.Clienttemp_customer;

public interface ClienttempDao {
		//添加临时公司并返回公司id
		int addClienttemp(Clienttemp clienttemp);
		
		
		//添加临时公司id和对应客户id
		int addClienttemp_customer(Clienttemp_customer clienttemp_customer );
}
