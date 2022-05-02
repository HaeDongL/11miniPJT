package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public Map<String,Object> checkDuplication( @RequestBody User user) throws Exception{
		
		System.out.println("json/user/checkDuplication : POST");
		//Business Logic
		System.out.println("json check "+user.getUserId());
		
		boolean result=userService.checkDuplication(user.getUserId());
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(result) {
			map.put("result", "사용가능한 아이디 입니다.");
		}else {
			map.put("result", "중복된 아이디 입니다.");
		}
		
		return map;
	}
}