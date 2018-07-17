package cn.itcast.scm.entity;

public class Inorder {
     private  String goodsName;
     private  String goodsAmount;
     private  String supName;
     private  String orderId;
     private  String orderTime;
     @Override
	public String toString() {
		return "Inorder [goodsName=" + goodsName + ", goodsAmount="
				+ goodsAmount + ", supName=" + supName + ", orderId=" + orderId
				+ ", orderTime=" + orderTime + ", orderOk=" + orderOk + "]";
	}
	private  String orderOk;
	public String getGoodsName() {
		return goodsName;
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
}
