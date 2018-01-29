package cn.dtw.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BaseDao {
	private static String classDriverName;
	private static String url;
	private static String user;
	private static String password;

	private Connection connection;
	private ResultSet rs;
	private PreparedStatement ps;

	static {
		InputStream in = BaseDao.class.getClassLoader().getResourceAsStream("config.properties");
		Properties ps = new Properties();
		try {
			ps.load(in);
			classDriverName = ps.getProperty("classDriverName");
			url = ps.getProperty("url");
			user = ps.getProperty("user");
			password = ps.getProperty("password");
			
		
			Class.forName(classDriverName);
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public boolean getConnection() {
		
		
		try {
			connection = DriverManager.getConnection(url, user, password);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		/*	Context cxt=null;
			try {
				cxt = new InitialContext();
			} catch (NamingException e) {
				e.printStackTrace();
			}	
			DataSource ds=null;
			try {
				ds = (DataSource)cxt.lookup("java:comp/env/jdbc/new");
			} catch (NamingException e) {
				e.printStackTrace();
			}
			try {
				connection = ds.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;*/
			
		}
	

	public ResultSet executeQuery(String sql, Object... params) {
		if (this.getConnection()) {
			try {
				ps = connection.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				rs = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}

	public int executeUpdate(String sql, Object... params) {
		if (this.getConnection()) {
			try {
				ps = connection.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				int rs = ps.executeUpdate();
				return rs;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
//返回id方法
	public int executeUpdateAndReturnId(String sql, Object... params) {
		if (this.getConnection()) {
			try {
				ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				int rs = ps.executeUpdate();
				int id=0;
				ResultSet resultSet = ps.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getInt(1);
				}
				return id;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public boolean closeRes() {
		boolean flag = true;
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}

}
