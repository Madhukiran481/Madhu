package com.convergys.spring.bootstrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.convergys.cit.agentInfo.Agent;
import com.convergys.cit.agentInfo.AgentResource;

@Controller
public class DefaultController {

  /*
   * @RequestMapping(value="/") public String showHome(){
   * 
   * return "login"; }
   */

  private AgentResource agentResource;

  public AgentResource getAgentResource() {
    return agentResource;
  }

  @Autowired
  public void setAgentResource(AgentResource agentResource) {
    this.agentResource = agentResource;
  }

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public ModelAndView showHome() {
    return new ModelAndView("login", "agent", new Agent());
  }

  @RequestMapping(value = "/MixedFinal", method = RequestMethod.POST)
  public String login(@ModelAttribute("agent")Agent agent, BindingResult result, ModelMap model) {
    if (!agent.getName().equals("") || !agent.getPassword().equals("")) {
      List<Agent> listOfAgents = agentResource.getAllAgentsInfo();
      for (Agent oneAgent : listOfAgents) {
        if (agent.getName().equals(oneAgent.getName()) && agent.getPassword().equals(oneAgent.getPassword())) {
          model.addAttribute("userName", agent.getName());
          model.addAttribute("password", agent.getPassword());
          return "MixedFinal";
        }
      }
    }
    model.addAttribute("msg","Bad Credentials");
    return "error";
  }

  @RequestMapping(value = "/logout")
  public String logout(@ModelAttribute("agent")Agent agent, ModelMap model) {
    model.addAttribute("name", agent.getName());
    return "logout";
  }
  /*@RequestMapping(value="/agent/updateStatus")
  public String status(Agent agent){
    agentResource.updateStatus(agent);
    System.out.println("updating the agent name:"+agent.getName() + "status:" +agent.getStatus());
    return "Mixedfinal";
  }*/

  /*
   * @RequestMapping(value="/",method = RequestMethod.POST) public String
   * submit(Model model, @ModelAttribute("user") User user) { if (user != null
   * && user.getUserName() != null & user.getPassword() != null) { if
   * (user.getUserName().equals("admin") && user.getPassword().equals("admin"))
   * { model.addAttribute("msg", "welcome" + user.getUserName()); return
   * "MixedFinal"; } else { model.addAttribute("error", "Invalid Details");
   * return "login"; } } else { model.addAttribute("error",
   * "Please enter Details"); return "login"; } }
   */

  /*
   * @RequestMapping(value="/", method = RequestMethod.GET) public String
   * showLogin(@ModelAttribute("user") User user, BindingResult
   * result,RedirectAttributes redirectAttributes){ if(result.hasErrors())
   * return "login"; System.out.println("username at login:" +
   * user.getUserName()); redirectAttributes.addFlashAttribute("user", user);
   * return "login"; }
   * 
   * @RequestMapping(value="/redirect", method=RequestMethod.GET) public String
   * redirect(@ModelAttribute("user") User user,final RedirectAttributes
   * redirectAttributes){
   * 
   * redirectAttributes.addFlashAttribute("user", user); return
   * "redirect:MixedFinal"; }
   * 
   * @RequestMapping(value="/MixedFinal", method=RequestMethod.GET) public
   * String login(@ModelAttribute("user") User user){
   * System.out.println("username:" + user.getUserName()); return "MixedFinal";
   * }
   */

  /*
   * Map<String, ?> inputFlashMap =
   * RequestContextUtils.getInputFlashMap(request); if(inputFlashMap != null){
   * String name = (String) inputFlashMap.get("userName");
   * System.out.println(name); return "login"; }
   */
}
