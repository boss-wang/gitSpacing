package cn.dtw.entity;

public class Clientcontact{
private int clientContactId;
private String clientContactName;
private int ClientContactTel;
private String ClientContactEmail;
private String ClientContactQQ;

public int getClientContactId(){
	return clientContactId;
}
public void setClientContactId(int clientContactId){
	this.clientContactId=clientContactId;
}


public String getClientContactName(){
	return clientContactName;
}
public void setClientContactName(String clientContactName){
	this.clientContactName=clientContactName;
}


public int getClientContactTel(){
	return ClientContactTel;
}
public void setClientContactTel(int ClientContactTel){
	this.ClientContactTel=ClientContactTel;
}


public String getClientContactEmail(){
	return ClientContactEmail;
}
public void setClientContactEmail(String ClientContactEmail){
	this.ClientContactEmail=ClientContactEmail;
}


public String getClientContactQQ(){
	return ClientContactQQ;
}
public void setClientContactQQ(String ClientContactQQ){
	this.ClientContactQQ=ClientContactQQ;
}

}