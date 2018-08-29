//https://github.com/spring-cloud/spring-cloud-netflix/issues/1952
package com.elevysi.site.social.config;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

public class FeignBeanFactoryPostProcessor implements BeanFactoryPostProcessor{

	@Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        BeanDefinition bd = beanFactory.getBeanDefinition("feignContext");
        bd.setDependsOn("eurekaServiceRegistry", "inetUtils");
    }

}
