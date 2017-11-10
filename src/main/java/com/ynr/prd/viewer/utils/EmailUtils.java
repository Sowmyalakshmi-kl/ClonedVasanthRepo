package com.ynr.prd.viewer.utils;

import org.springframework.mail.SimpleMailMessage;


public class EmailUtils {

	public static SimpleMailMessage getEmailConfiguration(String text, String subject, String fromAddr, String toAddr) {
		SimpleMailMessage registrationEmail = new SimpleMailMessage();
		registrationEmail.setTo(toAddr);
		registrationEmail.setSubject(subject);
		registrationEmail.setText(text);
		registrationEmail.setFrom(fromAddr);
		return registrationEmail;
	}
}
