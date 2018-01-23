package cn.dtw.entity;


public class Order{
private int orderId;
private int clientId;
private String orderNo;
private String systemNo;//系统号
private String mawbNo;//主单号
private String hawbNo;//分单号
private String flightNo;//航班号
private String departDate;//航班日期
private String arriveDate;//到港日期
private String destination;//目的港
private String cargoPiece;//件数
private Double cargoWeight;//货物重量
private Double chargeWeight;//计费重量
private Double cargoVolume;//体积
private int customsNo;//报关号
private int customsStatus;//报关单状态（0:未退，1:已退2:已寄）默认为0
private int orderStatus;//订单状态(0:未操作1:已报关2:已起飞3：已到港)  默认为0
private String updateTime;//最近修改时间默认为now

private String remarks;//备注
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