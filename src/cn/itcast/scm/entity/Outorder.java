package cn.itcast.scm.entity;

public class Outorder {
	 private  String goodsName;
     private  String goodsAmount;
     private  String supName;
     private  String orderId;
     private  String orderTime;
     public String getGoodsName() {
		return goodsName;
	}
	@Override
	public String toString() {
		return "Outorder [goodsName=" + goodsName + ", goodsAmount="
				+ goodsAmount + ", supName=" + supName + ", orderId=" + orderId
				+ ", orderTime=" + orderTime + ", orderOk=" + orderOk + "]";
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsAmount() {
		return goodsAmount;
	}
	public void setGoodsAmount(String goodsAmount) {
		this.goodsAmount = goodsAmount;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderOk() {
		return orderOk;
	}
	public void setOrderOk(String orderOk) {
		this.orderOk = orderOk;
	}
	private  String orderOk;
}
