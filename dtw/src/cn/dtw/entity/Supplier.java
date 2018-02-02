package cn.dtw.entity;

import java.util.List;

public class Supplier{
private int supplierId;
private String supplierName;
private String supplierAddress;
private List<Suppliercontact> supplierContacts;


public List<Suppliercontact> getSupplierContacts() {
	return supplierContacts;
}
public void setSupplierContacts(List<Suppliercontact> supplierContacts) {
	this.supplierContacts = supplierContacts;
}
public int getSupplierId(){
	return supplierId;
}
public void setSupplierId(int supplierId){
	this.supplierId=supplierId;
}


public String getSupplierName(){
	return supplierName;
}
public void setSupplierName(String supplierName){
	this.supplierName=supplierName;
}


public String getSupplierAddress(){
	return supplierAddress;
}
public void setSupplierAddress(String supplierAddress){
	this.supplierAddress=supplierAddress;
}

}