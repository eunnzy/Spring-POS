package com.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pos.dto.Sales;
import com.pos.service.SalesService;

@Controller
public class StatisticsController {
	@Autowired
	public SalesService salesService;
	
	@GetMapping("/statistics")
	public String statistics(Model model) {
		List<Sales> list = salesService.groupByStock();
		model.addAttribute("list", list);
		return "/statistics";
	}
	
	@RequestMapping(value = "/statistics/findSoldDate", method = RequestMethod.POST)
	@ResponseBody
	public List<Sales> findSoldDate(@RequestParam("soldDate") String soldDate) {
	
		System.out.println(salesService.findSoldDate(soldDate));
	
		return salesService.findSoldDate(soldDate);
	}

	
}
