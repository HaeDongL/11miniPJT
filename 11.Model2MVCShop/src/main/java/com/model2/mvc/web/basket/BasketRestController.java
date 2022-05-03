package com.model2.mvc.web.basket;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.basket.BasketService;
import com.model2.mvc.service.domain.User;

@RestController
@RequestMapping("/basket/*")
public class BasketRestController {
	
	@Autowired
	@Qualifier("basketServiceImpl")
	BasketService basketServiceImpl;
	
	public BasketRestController() {
		System.out.println("basketRest...");
	}
	
	
	///Method
	
	@RequestMapping(value = "json/getBasket",method=RequestMethod.GET)
	public Map<String,Object> getBasket(User user,
										@RequestParam int prodNo,
										HttpSession session)throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		user = (User)session.getAttribute("user");
		
		map.put("user",user);
		map.put("prodNo", prodNo);
		
		String basketProduct = basketServiceImpl.getBasket(map);
		
		map.put("basketProduct", basketProduct);
		System.out.println("getBasket "+map);
		
		return map;
	}
}
