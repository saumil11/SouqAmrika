package com.codelab.souqamrika.utility;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class CustomLogger {
	private final Logger log = Logger.getLogger(this.getClass());

	@Around("execution(* com.codelab.souqamrika..*.*(..))")
	public Object logTimeMethod(ProceedingJoinPoint joinPoint) throws Throwable {

		StringBuffer logMessage1 = new StringBuffer("START : ");
		logMessage1.append(joinPoint.getTarget().getClass().getSimpleName());
		logMessage1.append(".");
		logMessage1.append(joinPoint.getSignature().getName());
		log.info(logMessage1.toString());

		Object retVal = null;
		try {
			retVal = joinPoint.proceed();
		} catch (Throwable e) {
			StringBuffer logMessage2 = new StringBuffer("Error : ");
			logMessage2.append(joinPoint.getTarget().getClass().getSimpleName());
			logMessage2.append(".");
			logMessage2.append(joinPoint.getSignature().getName());
			log.error(logMessage2.toString() +" "+ e );
			e.printStackTrace();
		}

		StringBuffer logMessage = new StringBuffer("END : ");
		logMessage.append(joinPoint.getTarget().getClass().getSimpleName());
		logMessage.append(".");
		logMessage.append(joinPoint.getSignature().getName());
		log.info(logMessage.toString());

		return retVal;
	}
}
