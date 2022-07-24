package com.pos.service;

import java.util.List;

import com.pos.dao.SalesDao;
import com.pos.dto.Sales;

public class SalesService {
	private SalesDao salesDao;
	
	public SalesService(SalesDao salesDao) {
		this.salesDao = salesDao;
	}
	
	public void insertSold(String[] stockName, int[] amount, int[] price, String type) {
		salesDao.insertSold(stockName, amount, price, type);
	}
	
	public void updateStock(String[] stockName, int[] amount) {
		salesDao.updateStock(stockName, amount);
	}
	
	public List<Sales> salesHistory() {
		return salesDao.salesHistory();
	}
	
	public List<Sales> findSoldDate(String findDate) {
		return salesDao.findSoldDate(findDate);
	}
	
	public List<Sales> groupByStock() {
		return salesDao.groupByStock();
	}
	
 }
