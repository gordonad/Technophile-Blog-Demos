package com.gordondickens.simail.integration;

import org.springframework.integration.annotation.Gateway;

import com.gordondickens.simail.entity.Recipient;

public interface MailGateway {
	@Gateway
	public void sendMail(Recipient recipient);
}
