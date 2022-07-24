package com.pos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pos.dto.Stock;
import com.pos.dto.User;
import com.pos.service.StockService;


@Controller
public class StockController {
	@Autowired
	StockService stockService;
	
	@GetMapping("/stocks")
	public String stocks(Model model) {
		List<Stock> stockList = stockService.allStockList();
		model.addAttribute("stockList", stockList);
		return "/stocks";
	}
	
	@GetMapping("/stocks/addNewStock")  // 재고 추가 화면
	public String addNewStock() {
		return "addNewStock";
	}
	
	@GetMapping("/stocks/addStock") 
	public String addStock() {
		return "addStock";
	}
	
	@GetMapping("/stocks/modifyStock") 
	public String modifyStock() {
		return "modifyStock";
	}
	
	@GetMapping("/stocks/addStock/addComplete") 
	public String complete() {
		return "addComplete";
	}
	
	@GetMapping("/stocks/modifyStock/modifyComplete") 
	public String modifyComplete() {
		return "modifyComplete";
	}
	// -- 화면 매핑 ---
	
	// 아이디 중복 체크
	@RequestMapping(value = "/stocks/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam(value="stockId")String stockId) {
		int result = stockService.stockIdCheck(stockId);
		if (result == 1) { // 중복이면
			return 1;
		}
		return 0; // 중복되는 거 없으면
	}
	
	// 새로운 제품 추가 수행
	@RequestMapping(value = "/stocks/addNewStock.do", method = RequestMethod.POST)
	public String addNewStockComplete(@ModelAttribute Stock stock) {
		stockService.addNewStock(stock);
		return "redirect: /stocks";
	}
	// 제품 입고 수행
	@RequestMapping(value = "/stocks/addStock/addComplete", method = RequestMethod.POST)
	public String addStockPost(Model model,
			@RequestParam(value = "stockId") String stockId, @RequestParam(value = "amount") int amount) {
		stockService.addStock(stockId, amount);
		return "/addComplete";
	}

	// 제품 수정 수행
	@RequestMapping(value = "/stocks/modifyStock/modifyComplete", method = RequestMethod.POST)
	public String modifyStockPost(Model model, @ModelAttribute Stock stock) {
		stockService.modifyStock(stock);
		return "/modifyComplete";
	}
	// 판매 상태 --> 불가(0)로 변경 
	@RequestMapping(value = "/stocks/deleteStock", method = RequestMethod.POST)
	@ResponseBody 
	public void deleteStock(@RequestParam(value = "stockId") String stockId) {
		stockService.deleteStock(stockId);
	}
	// 판매 상태 --> 가능(1)로 변경
	@RequestMapping(value = "/stocks/availableStock", method = RequestMethod.POST)
	@ResponseBody 
	public void availableStock(@RequestParam(value = "stockId") String stockId) {
		stockService.availableStock(stockId);
	}
	
	
	
}
