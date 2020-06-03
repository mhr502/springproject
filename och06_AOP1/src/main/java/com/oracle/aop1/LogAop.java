package com.oracle.aop1;

import org.aspectj.lang.ProceedingJoinPoint;

public class LogAop {
	//proxy:대행
// Around Advice에서 사용할 공통기능 메서드는,대부분 파라미터로 전달받은 ProceedingJoinPoint의 proceed() 메서드만 호출
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		// 핵심 기능이름: loggerAop
	    String signatureStr = joinpoint.getSignature().toShortString();
		System.out.println( signatureStr + " is start."); //어떤 메소드가 실행됬는지 확인하기 위해서 'getStudentInfo' 출력
		//메소드가 시작됨
		long st = System.currentTimeMillis(); //공통기능, 핵심기능이 실행되기전 시간
		
		try {
			// 핵심기능 수행
			Object obj = joinpoint.proceed();
			return obj;
		} finally {
			long et = System.currentTimeMillis(); //실행된 후의 시간
			System.out.println( signatureStr + " is finished.");
			System.out.println( signatureStr + " 경과시간 : " + (et - st)); //핵심기능이 돌아간 시간
		}
	}
	
}
