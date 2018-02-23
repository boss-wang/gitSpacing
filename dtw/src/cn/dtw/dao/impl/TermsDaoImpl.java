package cn.dtw.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.dtw.dao.BaseDao;
import cn.dtw.dao.TermsDao;
import cn.dtw.entity.Order;
import cn.dtw.entity.Terms;

public class TermsDaoImpl extends BaseDao implements TermsDao {

	//获取贸易方式列表
	@Override
	public List<Terms> getAllTerms() {
		String sql = "select * from terms";
		return super.executeQuery(new BeanListHandler<Terms>(Terms.class), sql);
	}
	//通过id获取贸易方式信息
	@Override
	public Terms getTermsById(Order order) {
		String sql = "select * from terms where id=?";
		return super.executeOneRow(new BeanHandler<Terms>(Terms.class), sql, order.getTermsId());
	}

}
