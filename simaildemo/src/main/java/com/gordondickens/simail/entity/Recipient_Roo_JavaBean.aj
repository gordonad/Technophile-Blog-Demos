// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gordondickens.simail.entity;

import java.lang.String;

privileged aspect Recipient_Roo_JavaBean {
    
    public String Recipient.getRecipientEmail() {
        return this.recipientEmail;
    }
    
    public void Recipient.setRecipientEmail(String recipientEmail) {
        this.recipientEmail = recipientEmail;
    }
    
    public String Recipient.getSubject() {
        return this.subject;
    }
    
    public void Recipient.setSubject(String subject) {
        this.subject = subject;
    }
    
    public String Recipient.getMessageBody() {
        return this.messageBody;
    }
    
    public void Recipient.setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }
    
}
