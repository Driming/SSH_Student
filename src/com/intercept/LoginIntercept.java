package com.intercept;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginIntercept implements Interceptor{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		
		Map<String, Object> session=invocation.getInvocationContext().getSession();
		Object account = session.get("account");
		if(account==null){
			return "error";
		}
		else{
			return invocation.invoke();
		}
	}

}
