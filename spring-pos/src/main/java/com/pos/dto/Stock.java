package com.pos.dto;

public class Stock {
	private String stockId;   // 제품 코드
	private String stockName;	// 제품 이름
	private int amount;	 // 제품 개수
	private int price;	 // 제품 가격
	private int available;  // 제품이용가능한지
	private String regDate; // 업데이트 날짜
	
	public Stock() {	}
	
	public Stock(String stockId, String stockName, int amount, int price, String regDate, int available) {
		this.stockId = stockId;
		this.stockName = stockName;
		this.amount = amount;
		this.price = price;
		this.available = available;
		this.regDate = regDate;
	}
	
	
	public Stock(String stockId, int amount, int price, String regDate) {
		super();
		this.stockId = stockId;
		this.amount = amount;
		this.price = price;
		this.regDate = regDate;
	}

	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
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
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", stockName=" + stockName + ", amount=" + amount + ", price=" + price
				+ ", available=" + available + ", regDate=" + regDate + "]";
	}
}
