package com.convergys.cit.agentInfo;

import java.util.List;

public interface AgentInfo {
	
	public List<Agent> getAllAgentsInfo();
	
	public Agent getAgentInfo(Agent agent);
	
	public List<Agent> getAllAgentStatus();
	
	public Agent getAgentStatus(Agent agent);
	
	public boolean updateStatus(Agent agent/*String name, String status*/);
	
	public Agent addAgent(Agent agent);
	
	public Agent removeAgent(Agent agent);

}
