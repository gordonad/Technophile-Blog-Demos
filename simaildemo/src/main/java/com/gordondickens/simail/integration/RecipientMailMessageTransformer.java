package com.gordondickens.simail.integration;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailMessage;
import org.springframework.util.StringUtils;

import com.gordondickens.simail.entity.Recipient;


public class RecipientMailMessageTransformer {
    @Autowired
	MailMessage mailMessage;

	public MailMessage transform(Recipient recipient) {
		if (recipient == null) {
			return null;
		}

		mailMessage
				.setTo(StringUtils.hasText(recipient.getRecipientEmail()) ? recipient
						.getRecipientEmail() : "");
		mailMessage
				.setSubject(StringUtils.hasText(recipient.getSubject()) ? recipient
						.getSubject() : "");
		mailMessage.setSentDate(new Date(0));
		mailMessage
				.setText(StringUtils.hasText(recipient.getMessageBody()) ? recipient
						.getMessageBody() : "");

		return mailMessage;
	}
}
