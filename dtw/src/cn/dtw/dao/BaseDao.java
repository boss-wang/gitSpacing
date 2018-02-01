package cn.dtw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.dtw.util.JdbcUtil;

public class BaseDao {
	
	private Connection connection;
	private QueryRunner queryRunner = new QueryRunner();

//查询方法
	public <T> List<T> executeQuery(BeanListHandler<T> mapper,String sql, Object... params) {
		connection = JdbcUtil.getConnection();
		List<T> list = new ArrayList<T>();
		try {
			list = queryRunner.query(connection, sql, mapper, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeRes(connection);
		}
		return list;
	}
//查询单行方法
	public <T> T executeOneRow(BeanHandler<T> mapper,String sql,Object...params) {
		connection = JdbcUtil.getConnection();
		try {
			return queryRunner.query(connection, sql, mapper, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeRes(connection);
		}
		return null;
	}
//查询单列方法
	public Object executeOneColumn(ScalarHandler mapper,String sql,Object...params) {
		connection = JdbcUtil.getConnection();
		try {
			return queryRunner.query(connection, sql, mapper, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeRes(connection);
		}
		return null;
	}
	
//增删改方法
	public int executeUpdate(String sql, Object... params) {
		connection = JdbcUtil.getConnection();
		PreparedStatement ps = null;
			try {
				ps = connection.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				int rs = ps.executeUpdate();
				return rs;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.closeRes(ps, connection);
			}
		return 0;
	}
//返回id方法
	public int executeUpdateAndReturnId(String sql, Object... params) {
		connection = JdbcUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet resultSet = null;
			try {
				ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				int rs = ps.executeUpdate();
				int id=0;
				resultSet = ps.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getInt(1);
				}
				return id;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.closeRes(resultSet, ps, connection);
			}
		return 0;
	}
}
