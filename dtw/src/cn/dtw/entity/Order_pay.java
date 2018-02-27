package cn.dtw.entity;

public class Order_pay{
private int id;
private int orderId;
private int supplierId;
private Double unitPrice;
private Double otherPrice;
private Double totalPrice;
private String invoiceNo;
private int payStatus;
private Supplier supplier;

public Supplier getSupplier() {
	return supplier;
}
public void setSupplier(Supplier supplier) {
	this.supplier = supplier;
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


public int getSupplierId(){
	return supplierId;
}
public void setSupplierId(int supplierId){
	this.supplierId=supplierId;
}


public Double getUnitPrice(){
	return unitPrice;
}
public void setUnitPrice(Double unitPrice){
	this.unitPrice=unitPrice;
}


public Double getOtherPrice(){
	return otherPrice;
}
public void setOtherPrice(Double otherPrice){
	this.otherPrice=otherPrice;
}


public Double getTotalPrice(){
	return totalPrice;
}
public void setTotalPrice(Double totalPrice){
	this.totalPrice=totalPrice;
}


public String getInvoiceNo(){
	return invoiceNo;
}
public void setInvoiceNo(String invoiceNo){
	this.invoiceNo=invoiceNo;
}


public int getPayStatus(){
	return payStatus;
}
public void setPayStatus(int payStatus){
	this.payStatus=payStatus;
}

}