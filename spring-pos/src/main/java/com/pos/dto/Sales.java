package com.pos.dto;

import java.util.List;

public class Sales {
	private String stockName; // 제품 이름
	private int amount;	 // 제품 개수
	private int price; // 제품 가격
	private String soldDate;  // 판매 날짜
	private String type;  // 결제 수단
	
	public Sales(String stockName, int amount, int price, String soldDate, String type) {
		this.stockName = stockName;
		this.amount = amount;
		this.price = price;
		this.soldDate = soldDate;
		this.type = type;
	}
	
	public Sales(String stockName, int amount, int price) {
		this.stockName = stockName;
		this.amount = amount;
		this.price = price;
	}
	
	
	public Sales(String stockName, int amount, int price, String soldDate) {
		this.stockName = stockName;
		this.amount = amount;
		this.price = price;
		this.soldDate = soldDate;
	}

	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSoldDate() {
		return soldDate;
	}
	public void setSoldDate(String soldDate) {
		this.soldDate = soldDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Sales [stockName=" + stockName + ", amount=" + amount + ", price=" + price + ", soldDate=" + soldDate
				+ ", type=" + type + "]";
	}

	
}
