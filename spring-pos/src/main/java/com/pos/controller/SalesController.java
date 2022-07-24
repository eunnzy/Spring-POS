package com.pos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pos.dto.Sales;
import com.pos.dto.Stock;
import com.pos.service.SalesService;
import com.pos.service.StockService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class SalesController {
	@Autowired
	StockService stockService;
	@Autowired
	SalesService salesService;
	
	@GetMapping("/sales")
	public String sales(Model model) {
		List<Stock> stockList = stockService.stockAvailableList();
		model.addAttribute("stockList", stockList);
		return "/sales";
	}
	
	// 판매내역 화면
	@GetMapping("/sales/salesHistory")
	public String salesHistory(Model model) {
		List<Sales> salesList = salesService.salesHistory();
		model.addAttribute("salesList", salesList);
		
		return "salesHistory";
	}
	
	
	 @RequestMapping(value = "/sales/pay", method = RequestMethod.POST)
	 @ResponseBody 
	 public String salesList(	@RequestParam(value="stockName[]")String[] stockName, 
						 @RequestParam(value="amount[]")int[] amount,  
						 @RequestParam(value="price[]")int[] price, @RequestParam(value="type") String type) { 
		 
		 salesService.insertSold(stockName, amount, price, type);
		 salesService.updateStock(stockName, amount);
		 
		 return "redirect: /sales";
	 }
	
}
