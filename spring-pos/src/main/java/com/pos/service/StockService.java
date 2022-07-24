package com.pos.service;

import java.util.List;

import com.pos.dao.StockDao;
import com.pos.dto.Stock;

public class StockService {
	private StockDao stockDao;
	
	public StockService(StockDao stockDao) {
		this.stockDao = stockDao;
	}

	public void addNewStock(Stock stock) {
		stockDao.addNewStock(stock);
	}

	public List<Stock> stockAvailableList() {
		return stockDao.stockAvailableList();
	}
	
	public void addStock(String stockId, int amount) {
		stockDao.addStock(stockId, amount);
	}
	
	public void deleteStock(String stockId) {
		stockDao.deleteStock(stockId);
	}
	
	public void availableStock(String stockId) {
		stockDao.availableStock(stockId);
	}
	
	public List<Stock> allStockList() {
		return stockDao.allStockList();
	}
	
	public void modifyStock(Stock stock) {
		stockDao.modifyStock(stock);
	}
	public int stockIdCheck(String stockId) {
		return stockDao.stockIdCheck(stockId);
	}
}
