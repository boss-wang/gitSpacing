package cn.dtw.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
			connection = DriverManager.getConnection(url,user,password);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ResultSet executeQuery(String sql,Object... params) {
		if(this.getConnection()) {
			try {
				ps = connection.prepareStatement(sql);
				for(int i=0;i<params.length;i++) {
					ps.setObject(i+1, params[i]);
				}
				rs = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	public int executeUpdate(String sql,Object... params) {
		if(this.getConnection()) {
			try {
				ps = connection.prepareStatement(sql);
				for(int i=0;i<params.length;i++) {
					ps.setObject(i+1, params[i]);
				}
				int rs = ps.executeUpdate();
				return rs;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public boolean closeRes() {
		boolean flag = true;
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
		}
		if(connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
		}
		return flag;
	}

}
