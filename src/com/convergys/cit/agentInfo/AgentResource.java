package com.convergys.cit.agentInfo;

import java.net.UnknownHostException;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.vz.mongodb.jackson.JacksonDBCollection;
import net.vz.mongodb.jackson.WriteResult;

import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.MongoURI;


@Component
@Path("/agent")
public class AgentResource implements AgentInfo {

	public static DB mongoDB;

	public static String contentUrl;

	static{
		MongoURI mongolabUri = new MongoURI(
				System.getenv("MONGOLAB_URI") != null ? System
						.getenv("MONGOLAB_URI")
						: "mongodb://148.181.168.142:27017/IVP");
		Mongo m=null;
		try {
			m = new Mongo(mongolabUri);
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mongoDB = m.getDB(mongolabUri.getDatabase());
		if ((mongolabUri.getUsername() != null)
				&& (mongolabUri.getPassword() != null)) {
			mongoDB.authenticate(mongolabUri.getUsername(),
					mongolabUri.getPassword());
		}

	}

	private JacksonDBCollection<Agent, String> getJacksonDBCollection() {
		return JacksonDBCollection.wrap(mongoDB
				.getCollection(Agent.class.getSimpleName().toLowerCase()),
				Agent.class, String.class);
	}

/*	@GET
	@Produces(MediaType.TEXT_HTML)
	public String index() {
		return "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n"
				+ "<script type='text/javascript' src='"
				+ AgentServer.contentUrl + "/jquery-1.7.min.js'></script>\n"
				+ "<script type='text/javascript' src='"
				+ AgentServer.contentUrl + "/index.js'></script>\n"
				+ "</head>\n" + "</html>";
	}
*/
	@Path("addAgent")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Agent addAgent(Agent agent) {
		WriteResult<Agent, String> result = getJacksonDBCollection().insert(
				agent);
		return result.getSavedObject();
	}

	@Path("getAgents")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Agent> getAllAgentsInfo() {
		return getJacksonDBCollection().find().toArray();
	}

	public Agent getAgentInfo(Agent agent) {
		// TODO Auto-generated method stub
		return null;
	}

	public Agent getAgentStatus(Agent agent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Path("updateStatus")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public boolean updateStatus(Agent agent) {
	  
	  /*System.out.println(name + ":" + status);*/

		System.out.println("Received values Agent Name: " + agent.getName()
				+ " Status: " + agent.getStatus());
		BasicDBObject query = new BasicDBObject().append("name", agent.getName());
		DBCollection collection = mongoDB.getCollection("agent");
		BasicDBObject newDocument = new BasicDBObject();
		newDocument.append("$set",
				new BasicDBObject().append("status", agent.getStatus()));
		collection.update(query, newDocument);
		return false;
	}

	public List<Agent> getAllAgentStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	public Agent removeAgent(Agent agent) {
		// TODO Auto-generated method stub
		return null;
	}

}