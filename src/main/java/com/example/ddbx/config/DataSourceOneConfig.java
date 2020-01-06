package com.example.ddbx.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import javax.sql.DataSource;
@Configuration
@MapperScan(basePackages = "com.example.ddbx.transfer.dao.one", sqlSessionTemplateRef = "sqlSessionTemplateOne")
public class DataSourceOneConfig {
    @Bean(name = "primaryJdbcTemplate")
    public JdbcTemplate primaryTemplate(@Qualifier("dataSourceOne") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
    @Bean(name = "dataSourceOne")
    @ConfigurationProperties(prefix = "spring.datasource.source1")
    @Primary
    //设置主数据源
    public DataSource DataSourceOne() {
        DruidDataSource dataSource = new DruidDataSource();
        return dataSource;
    }
    @Bean(name = "sqlSessionFactoryOne")
    @Primary
    public SqlSessionFactory sqlSessionFactoryOne(@Qualifier("dataSourceOne") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/one/*.xml"));
        bean.setTypeAliasesPackage("com.example.ddbx.transfer.entity.one");
        return bean.getObject();
    }
    //事务管理
    @Bean(name = "dataSourceTransactionManagerOne")
    @Primary
    public DataSourceTransactionManager dataSourceTransactionManagerOne(@Qualifier("dataSourceOne") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
    @Bean(name = "sqlSessionTemplateOne")
    @Primary
    public SqlSessionTemplate sqlSessionTemplateOne(@Qualifier("sqlSessionFactoryOne") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}