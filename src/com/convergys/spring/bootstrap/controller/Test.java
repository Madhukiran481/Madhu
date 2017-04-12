package com.convergys.spring.bootstrap.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.convergys.cit.agentInfo.Agent;
import com.convergys.cit.agentInfo.AgentResource;


public class Test {

  public static void main(String[] args) {

    ApplicationContext context  = new ClassPathXmlApplicationContext("/WEB-INF/default-servlet.xml");
    
    AgentResource agentResource = (AgentResource)context.getBean("AgentResource");
    
    List<Agent> agentList =agentResource.getAllAgentsInfo();
    
    for(Agent agent: agentList){
      System.out.println(agent);
    }
    
    ((ClassPathXmlApplicationContext)context).close();
    
  }

}
