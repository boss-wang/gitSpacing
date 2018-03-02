package cn.dtw.entity;

public class Clienttemp_customer {
	private int customerId;
	private  int clientId;
	private int clientExists;//0:不存在，1:存在
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getClientExists() {
		return clientExists;
	}
	public void setClientExists(int clientExists) {
		this.clientExists = clientExists;
	}
	
}
