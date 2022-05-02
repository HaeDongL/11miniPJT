package com.model2.mvc.web.basket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.basket.BasketService;
import com.model2.mvc.service.domain.User;

@RequestMapping("/basket/*")
public class BasketRestController {
	
	@Autowired
	@Qualifier("basketServiceImpl")
	BasketService basketServiceImpl;
	
	public BasketRestController() {
		System.out.println("basketRest...");
	}
	
	
	///Method
	
	@RequestMapping("json/getBasket")
	public Map<String,Object> getBasket(User user,@RequestParam int prodNo)throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("user",user);
		map.put("prodNo", prodNo);
		
		String basketProduct = basketServiceImpl.getBasket(map);
		
		return map;
	}
}
