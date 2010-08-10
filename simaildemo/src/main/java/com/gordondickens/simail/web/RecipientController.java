package com.gordondickens.simail.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gordondickens.simail.entity.Recipient;
import com.gordondickens.simail.integration.MailGateway;

@RooWebScaffold(path = "recipients", formBackingObject = Recipient.class)
@RequestMapping("/recipients")
@Controller
public class RecipientController {
	@Autowired
	MailGateway mailGateway;

	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid Recipient recipient, BindingResult result,
			ModelMap modelMap) {
		if (result.hasErrors()) {
			modelMap.addAttribute("recipient", recipient);
			return "recipients/create";
		}
		recipient.persist();
		mailGateway.sendMail(recipient);
		return "redirect:/recipients/" + recipient.getId();
	}
}
