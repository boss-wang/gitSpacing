package cn.dtw.entity;

public class Customer{
private int id;
private String loginName;
private String loginPwd;
private String tel;
private String email;
private int statusId;
private Clienttemp clientTemp;
private int clientExists;
private String realName;



public String getRealName() {
	return realName;
}
public void setRealName(String realName) {
	this.realName = realName;
}
public Clienttemp getClientTemp() {
	return clientTemp;
}
public void setClientTemp(Clienttemp clientTemp) {
	this.clientTemp = clientTemp;
}
public int getClientExists() {
	return clientExists;
}
public void setClientExists(int clientExists) {
	this.clientExists = clientExists;
}
public int getStatusId() {
	return statusId;
}
public void setStatusId(int statusId) {
	this.statusId = statusId;
}
public int getId(){
	return id;
}
public void setId(int id){
	this.id=id;
}


public String getLoginName(){
	return loginName;
}
public void setLoginName(String loginName){
	this.loginName=loginName;
}


public String getLoginPwd(){
	return loginPwd;
}
public void setLoginPwd(String loginPwd){
	this.loginPwd=loginPwd;
}


public String getTel(){
	return tel;
}
public void setTel(String tel){
	this.tel=tel;
}


public String getEmail(){
	return email;
}
public void setEmail(String email){
	this.email=email;
}

}