package com.huangbo.utils;

import javax.persistence.Table;

public class Utils {
	/**
	 * 通过类名获取实体类所对应的表明
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
