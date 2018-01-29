package cn.dtw.entity;

import java.util.List;

public class User{
private int userId;
private String userAccount;
private String userPwd;
private String userName;
private String userSex;
private List<Role> roles;

public List<Role> getRoles() {
	return roles;
}
public void setRoles(List<Role> roles) {
	this.roles = roles;
}
public int getUserId(){
	return userId;
}
public void setUserId(int userId){
	this.userId=userId;
}


public String getUserAccount(){
	return userAccount;
}
public void setUserAccount(String userAccount){
	this.userAccount=userAccount;
}


public String getUserPwd(){
	return userPwd;
}
public void setUserPwd(String userPwd){
	this.userPwd=userPwd;
}


public String getUserName(){
	return userName;
}
public void setUserName(String userName){
	this.userName=userName;
}


public String getUserSex(){
	return userSex;
}
public void setUserSex(String userSex){
	this.userSex=userSex;
}

}