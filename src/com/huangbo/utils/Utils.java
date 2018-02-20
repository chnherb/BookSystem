package com.huangbo.utils;

import javax.persistence.Table;

public class Utils {
	/**
	 * ͨ��������ȡʵ��������Ӧ�ı���
	 * @param clazz
	 * @return
	 */
	public static <T> String getRealTableName(Class<T> clazz){
		Table annotation = clazz.getAnnotation(Table.class);
		String tableName = annotation.name();
		if("".equals(tableName)){
			tableName = clazz.getSimpleName();
		}
		return tableName;
	}
}
