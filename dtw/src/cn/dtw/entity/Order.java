package cn.dtw.entity;


public class Order{
private int orderId;
private int clientId;
private String orderNo;
private String systemNo;
private String mawbNo;
private String hawbNo;
private String flightNo;
private String departDate;
private String arriveDate;
private String destination;
private String cargoPiece;
private Double cargoWeight;
private Double chargeWeight;
private Double cargoVolume;
private int customsNo;
private int customsStatus;
private int orderStatus;
private String updateTime;
private String remarks;
private int userId;

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


public String getOrderNo(){
	return orderNo;
}
public void setOrderNo(String orderNo){
	this.orderNo=orderNo;
}


public String getSystemNo(){
	return systemNo;
}
public void setSystemNo(String systemNo){
	this.systemNo=systemNo;
}


public String getMawbNo(){
	return mawbNo;
}
public void setMawbNo(String mawbNo){
	this.mawbNo=mawbNo;
}


public String getHawbNo(){
	return hawbNo;
}
public void setHawbNo(String hawbNo){
	this.hawbNo=hawbNo;
}


public String getFlightNo(){
	return flightNo;
}
public void setFlightNo(String flightNo){
	this.flightNo=flightNo;
}


public String getDepartDate(){
	return departDate;
}
public void setDepartDate(String departDate){
	this.departDate=departDate;
}


public String getArriveDate(){
	return arriveDate;
}
public void setArriveDate(String arriveDate){
	this.arriveDate=arriveDate;
}


public String getDestination(){
	return destination;
}
public void setDestination(String destination){
	this.destination=destination;
}


public String getCargoPiece(){
	return cargoPiece;
}
public void setCargoPiece(String cargoPiece){
	this.cargoPiece=cargoPiece;
}


public Double getCargoWeight(){
	return cargoWeight;
}
public void setCargoWeight(Double cargoWeight){
	this.cargoWeight=cargoWeight;
}


public Double getChargeWeight(){
	return chargeWeight;
}
public void setChargeWeight(Double chargeWeight){
	this.chargeWeight=chargeWeight;
}


public Double getCargoVolume(){
	return cargoVolume;
}
public void setCargoVolume(Double cargoVolume){
	this.cargoVolume=cargoVolume;
}


public int getCustomsNo(){
	return customsNo;
}
public void setCustomsNo(int customsNo){
	this.customsNo=customsNo;
}


public int getCustomsStatus(){
	return customsStatus;
}
public void setCustomsStatus(int customsStatus){
	this.customsStatus=customsStatus;
}


public int getOrderStatus(){
	return orderStatus;
}
public void setOrderStatus(int orderStatus){
	this.orderStatus=orderStatus;
}


public String getUpdateTime(){
	return updateTime;
}
public void setUpdateTime(String updateTime){
	this.updateTime=updateTime;
}


public String getRemarks(){
	return remarks;
}
public void setRemarks(String remarks){
	this.remarks=remarks;
}


public int getUserId(){
	return userId;
}
public void setUserId(int userId){
	this.userId=userId;
}

}