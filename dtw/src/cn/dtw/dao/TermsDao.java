package cn.dtw.dao;

import java.util.List;

import cn.dtw.entity.Order;
import cn.dtw.entity.Terms;

public interface TermsDao {
	//获取贸易方式列表
	public List<Terms> getAllTerms();
	//通过id获取贸易条款信息
	public Terms getTermsById(Order order);
}
