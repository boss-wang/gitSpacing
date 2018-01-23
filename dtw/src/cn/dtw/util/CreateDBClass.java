package cn.dtw.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CreateDBClass {
	public static void main(String[] args) {
		String user="root";			//数据库用户名  
		String password="1234";		//数据库密码
		String dbName="dtwmanage";		//数据库名称
		String packageName="entity";	//准备创建的包名（可修改）
		//创建一个当前类的对象
		CreateDBClass ct=new CreateDBClass();
		
		/*下面的方法返回数据库的表名及其列，key存放表名；
		  value存放列的数据类型和列名，如：第一个内容是"int",第二个内容是"studentNo",第三个内容是"String",第四个内容是"studentName"，以此类推*/
		Map<String, List<String>> tables=ct.getTables(dbName,user,password);
		
		//用获得的表名和列名创建java文件
		ct.createFiles(tables,packageName);
		
	}
	
	//此方法获取列名,并返回带有表名及其列的Map集合
	public Map<String, List<String>> getTables(String dbName,String user,String password) {
		String url="jdbc:mysql://localhost:3306/"+dbName+"?characterEncoding=utf-8";
		//dbDate用于保存数据库表对象
		DatabaseMetaData dbDate=null;
		//保存表名的List
		List<String> tableNames=new ArrayList<String>();
		//保存表名和列名的Map
		Map<String,List<String>> tables = new HashMap<String,List<String>>();
		try {
			//连接数据库
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url, user, password);
			dbDate = connection.getMetaData();
			//调用getTableNames（）方法，获取表名
			tableNames = getTableNames(dbDate);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//遍历表名
		for(String tableName:tableNames) {
			try {
				List<String> columns=new ArrayList<String>();	//准备存放列的数据类型和名字
				ResultSet rst = dbDate.getColumns(null,"%", tableName,"%");	//根据表名获得列
				//遍历列中的数据类型和内容
				while(rst.next()) {
					String columnType = rst.getString("TYPE_NAME").toLowerCase();
					//判断数据类型，并将其转换成java中的数据类型
					 if (columnType.equals("varchar") || columnType.equals("char")||columnType.equals("datetime") ) {
						 columnType="String";
					 } else if (columnType.equals("int")||columnType.equals("tinyint")||columnType.equals("int unsigned")) {
						 columnType="int";
					 } else if (columnType.equals("float")) {
						 columnType="Float";
					 } else if (columnType.equals("double")) {
						 columnType="Double";
					 }
					 columns.add(columnType);	//存入数据类型
					 columns.add(rst.getString("COLUMN_NAME"));	//存入列名
				}
				tables.put(tableName, columns);	//将表名和列一起存入Map集合
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return tables;
	}
	
	//此方法用于获取表名
	public List<String> getTableNames(DatabaseMetaData dbDate) {
		try {
			ResultSet rst = dbDate.getTables(null, "%",null,new String[]{"TABLE"});
			List<String> tableNames = new ArrayList<String>();
			while(rst.next()) {
				tableNames.add(rst.getString("TABLE_NAME"));
			}
			return tableNames;	//返回存有所有表名的List集合
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
		
	//创建java文件
	public void createFiles(Map<String, List<String>> tables,String packageName) {
		
		Set<String> tableNames = tables.keySet();
		for(String tableName:tableNames) {
			StringBuffer sb = new StringBuffer();	//sb用来存放文件内容
			//准备创建目标文件
			String szm = tableName.substring(0, 1).toUpperCase();
			String moye=tableName.substring(1);
			String className = szm+moye;
			File file = new File("src\\"+packageName+"\\"+className+".java");
			//如果包文件不存在则创建一个
			if(!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			sb.append("package "+packageName+";"+"\n\n");
			sb.append("public class "+className);
			sb.append("{"+"\n");
			//遍历列名，作为属性加入到sb中
			List<String> columns= tables.get(tableName);
			for(int i=0;i<columns.size();i=i+2) {
				sb.append("private ");
				sb.append(columns.get(i)+" ");
				sb.append(columns.get(i+1)+";\n");
				
			}
			for(int i=0;i<columns.size();i=i+2) {
				//加入get方法
				sb.append("\npublic "+columns.get(i)+" ");
				String methodName = columns.get(i+1).substring(0, 1).toUpperCase()+columns.get(i+1).substring(1);
				sb.append("get"+methodName+"(){\n");
				sb.append("\treturn "+columns.get(i+1)+";\n}\n");
				//加入get方法
				sb.append("public void set"+methodName+"("+columns.get(i)+" "+columns.get(i+1)+"){\n");
				sb.append("\tthis."+columns.get(i+1)+"="+columns.get(i+1)+";\n}\n\n");
		
			}
			sb.append("}");
			try {
				FileWriter fw = new FileWriter(file);
				fw.write(sb.toString());	//内容写入文件
				System.out.println(file.getAbsolutePath());
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

}
