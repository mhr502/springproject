package oracle.java.omyBatis3.service;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SampleInterceptor extends HandlerInterceptorAdapter{

	//interceptor 순서3
	@Override
	public void postHandle(HttpServletRequest request,
						   HttpServletResponse response,
						   Object handler,  	//가로챈 후
			               ModelAndView modelAndView) throws Exception {
		System.out.println("post handle........................");
		String ID= (String)modelAndView.getModel().get("id");
		int memCnt = (Integer) modelAndView.getModel().get("memCnt");
		System.out.println("SampleInterceptor post handle memCnt: "+memCnt);
		System.out.println("SampleInterceptor post handle ID: "+ID);
		if(memCnt<1) {
			System.out.println("memCnt Not exists");
			request.getSession().setAttribute("ID", ID);
			//User가 존재하지 않으면 User interCeptor Page(회원 등록)이동
			response.sendRedirect("doMemberWrite.do");
			
		}else {			//정상 Login User
			System.out.println("memCnt exists");
			request.getSession().setAttribute("ID", ID);
			//User가 존재하면 User interCeptor Page(회원 List) 이동
			response.sendRedirect("doMemberList.do");
		}
	}
	//interceptor 순서1
	@Override
	public boolean preHandle(HttpServletRequest request,   //가로채기전
							 HttpServletResponse response,	
							 Object handler)
			throws Exception {
		System.out.println("pre handle................");
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		System.out.println("Bean: "+method.getBean());
		System.out.println("Method: "+methodObj);
		return true;
	}
	
	
}
