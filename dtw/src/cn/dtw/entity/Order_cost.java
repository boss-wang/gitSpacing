package cn.dtw.entity;

public class Order_cost{
private int id;
private int orderId;
private int clientId;
private Double cost;
private String invoiceNo;
private int costStatus;
private Client client;
private Order order;	//保存订单详细信息
private CostStatus statusName;


public CostStatus getStatusName() {
	return statusName;
}
public void setStatusName(CostStatus statusName) {
	this.statusName = statusName;
}
public Order getOrder() {
	return order;
}
public void setOrder(Order order) {
	this.order = order;
}
public Client getClient() {
	return client;
}
public void setClient(Client client) {
	this.client = client;
}
public int getId(){
	return id;
}
public void setId(int id){
	this.id=id;
}


public int getOrderId(){
	return orderId;
}
public void setOrderId(int orderId){
	this.orderId=orderId;
}


public int getClientId(){
	return clientId;
}
public void setClientId(int clientId){
	this.clientId=clientId;
}


public Double getCost(){
	return cost;
}
public void setCost(Double cost){
	this.cost=cost;
}


public String getInvoiceNo(){
	return invoiceNo;
}
public void setInvoiceNo(String invoiceNo){
	this.invoiceNo=invoiceNo;
}


public int getCostStatus(){
	return costStatus;
}
public void setCostStatus(int costStatus){
	this.costStatus=costStatus;
}

}