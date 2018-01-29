package cn.dtw.entity;

import java.util.List;

public class Client{
private int clientId;
private String clientName;
private String clientAddress;
private List<Clientcontact> clientContactlist;//该客户公司联系人

public int getClientId(){
	return clientId;
}
public void setClientId(int clientId){
	this.clientId=clientId;
}


public String getClientName(){
	return clientName;
}
public void setClientName(String clientName){
	this.clientName=clientName;
}


public String getClientAddress(){
	return clientAddress;
}
public void setClientAddress(String clientAddress){
	this.clientAddress=clientAddress;
}
public List<Clientcontact> getClientContactlist() {
	return clientContactlist;
}
public void setClientContactlist(List<Clientcontact> clientContactlist) {
	this.clientContactlist = clientContactlist;
}


}