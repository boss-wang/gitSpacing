package cn.dtw.entity;

import java.util.List;

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
private String loadingPort;//起运港
private String destination;//目的港
private String cargoPiece;//件数
private Double cargoWeight;//货物重量
private Double chargeWeight;//计费重量
private Double cargoVolume;//体积
private String customsNo;//报关号
private int customsStatus;//报关单状态（0:未退，1:已退2:已寄）默认为0
private int statusId;//订单状态  默认为0
private String updateTime;//最近修改时间默认为now
private int termsId; //贸易条款
private String remarks;//备注
private Client client;
private CustomsStatus cusStatus;	//报关状态
private OrderStatus orderStatus;	//订单状态
private Terms terms;		//贸易条款
private List<Order_cost> orderCostList;		//应收列表
private List<Order_pay> orderPayList;	//应付列表
private int orderClientContactId;	//客户自助下单时填写的联系人id
private Clientcontact clientcontact;	//客户自助下单时填写的联系人
private Order_cost order_cost;

public Order_cost getOrder_cost() {
	return order_cost;
}
public void setOrder_cost(Order_cost order_cost) {
	this.order_cost = order_cost;
}
public int getOrderClientContactId() {
	return orderClientContactId;
}
public void setOrderClientContactId(int orderClientContactId) {
	this.orderClientContactId = orderClientContactId;
}
public Clientcontact getClientcontact() {
	return clientcontact;
}
public void setClientcontact(Clientcontact clientcontact) {
	this.clientcontact = clientcontact;
}
public String getLoadingPort() {
	return loadingPort;
}
public void setLoadingPort(String loadingPort) {
	this.loadingPort = loadingPort;
}
public List<Order_pay> getOrderPayList() {
	return orderPayList;
}
public void setOrderPayList(List<Order_pay> orderPayList) {
	this.orderPayList = orderPayList;
}
public List<Order_cost> getOrderCostList() {
	return orderCostList;
}
public void setOrderCostList(List<Order_cost> orderCostList) {
	this.orderCostList = orderCostList;
}
public Terms getTerms() {
	return terms;
}
public void setTerms(Terms terms) {
	this.terms = terms;
}
public OrderStatus getOrderStatus() {
	return orderStatus;
}
public void setOrderStatus(OrderStatus orderStatus) {
	this.orderStatus = orderStatus;
}
public CustomsStatus getCusStatus() {
	return cusStatus;
}
public void setCusStatus(CustomsStatus cusStatus) {
	this.cusStatus = cusStatus;
}
public Client getClient() {
	return client;
}
public void setClient(Client client) {
	this.client = client;
}
public int getTermsId() {
	return termsId;
}
public void setTermsId(int termsId) {
	this.termsId = termsId;
}
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


public String getCustomsNo(){
	return customsNo;
}
public void setCustomsNo(String customsNo){
	this.customsNo=customsNo;
}


public int getCustomsStatus(){
	return customsStatus;
}
public void setCustomsStatus(int customsStatus){
	this.customsStatus=customsStatus;
}


public int getStatusId(){
	return statusId;
}
public void setStatusId(int statusId){
	this.statusId=statusId;
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