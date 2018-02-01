package cn.dtw.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtil {
	public static DataSource dataSource;
	static {
		dataSource = new ComboPooledDataSource("webApp");
	}
	/**
	 * 获得连接的方法
	 * @return
	 */
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 关闭连接的方法
	 * @param conn
	 * @return
	 */
	public static boolean closeRes(Connection conn) {
		boolean flag = true;
		
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}
		
	public static boolean closeRes(Statement ps,Connection conn) {
		boolean flag = true;
		
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}
	public static boolean closeRes(ResultSet rs,Statement ps,Connection conn) {
		boolean flag = true;
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}
}
