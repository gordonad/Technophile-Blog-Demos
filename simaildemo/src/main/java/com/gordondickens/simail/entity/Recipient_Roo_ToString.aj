package com.gordondickens.simail.entity;

import java.lang.String;

privileged aspect Recipient_Roo_ToString {
    
    public String Recipient.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("RecipientEmail: ").append(getRecipientEmail()).append(", ");
        sb.append("Subject: ").append(getSubject()).append(", ");
        sb.append("MessageBody: ").append(getMessageBody());
        return sb.toString();
    }
    
}
