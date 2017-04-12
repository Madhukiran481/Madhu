package com.convergys.cit.agentInfo;

import javax.persistence.Id;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Agent {

  @Id
  public String  id;
  private String name;
  private String status;
  private String password;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String toString() {
    return "Agent [id=" + id + ", name=" + name + ", status=" + status + ", password=" + password + "]";
  }

}
