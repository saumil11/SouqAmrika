package com.codelab.souqamrika.utility;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQLDialect;
import org.hibernate.dialect.function.StandardSQLFunction;
import org.hibernate.type.StandardBasicTypes;

public class CustomMySQLDialect extends MySQLDialect{
	
	public CustomMySQLDialect(){
		
		super();
		registerHibernateType(Types.BIGINT, StandardBasicTypes.LONG.getName());
	}
	
}
