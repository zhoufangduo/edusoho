package com.et.edusoho.support.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDaoSupport extends  SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactoryBean  factoryBean){
		this.setSqlSessionFactory(factoryBean);
	}
	
	protected void insert(String sql, Object params){
		this.getSqlSession().insert(sql, params);
	}
	
	protected void insert(String sql){
		this.getSqlSession().insert(sql);
	}
	
	protected void delete(String sql, Object params){
		this.getSqlSession().delete(sql, params);
	}
	
	protected void delete(String sql){
		this.getSqlSession().delete(sql);
	}
	
	protected void update(String sql){
		this.getSqlSession().update(sql);
	}
	
	protected void update(String sql, Object params){
		this.getSqlSession().update(sql, params);
	}
	
	protected <T> T get(String sql){
		return this.getSqlSession().selectOne(sql);
	}
	
	protected <T> T get(String sql, Object params){
		return this.getSqlSession().selectOne(sql, params);
	}
	
	protected <T> List<T> getList(String sql){
		return this.getSqlSession().selectList(sql);
	}
	
	protected <T> List<T> getList(String sql, Object params){
		return this.getSqlSession().selectList(sql, params);
	}
	
	protected <K,V> Map<K, V> getMap(String sql, String key) {
		return this.getSqlSession().selectMap(sql, key);
	}
	
	protected <K,V> Map<K, V> getMap(String sql,Object params, String key) {
		return this.getSqlSession().selectMap(sql, params, key);
	}
}
